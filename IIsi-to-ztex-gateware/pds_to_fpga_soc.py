import os
import argparse
from migen import *
from migen.genlib.fifo import *
from migen.fhdl.specials import Tristate

import litex
from litex.build.generic_platform import *
from litex.build.xilinx.vivado import vivado_build_args, vivado_build_argdict
from litex.soc.integration.soc import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.interconnect import wishbone
from litex.soc.cores.clock import *
from litex.soc.cores.led import LedChaser
import ztex213_pds
#import nubus_to_fpga_export

from litedram.modules import MT41J128M16
from litedram.phy import s7ddrphy

from litedram.frontend.dma import *

from liteeth.phy.rmii import LiteEthPHYRMII

from migen.genlib.cdc import BusSynchronizer
from migen.genlib.resetsync import AsyncResetSynchronizer

from litex.soc.cores.video import VideoS7HDMIPHY
from litex.soc.cores.video import VideoVGAPHY
from litex.soc.cores.video import video_timings
from VintageBusFPGA_Common.goblin_accel import *

# Wishbone stuff
from VintageBusFPGA_Common.cdc_wb import WishboneDomainCrossingMaster
from VintageBusFPGA_Common.fpga_blk_dma import *

# CRG ----------------------------------------------------------------------------------------------
class _CRG(Module):
    def __init__(self, platform, version, sys_clk_freq,
                 goblin=False,
                 pix_clk=0):
        self.clock_domains.cd_sys       = ClockDomain() # 100 MHz PLL, reset'ed by PDS (via pll), SoC/Wishbone main clock
        self.clock_domains.cd_sys4x     = ClockDomain(reset_less=True)
        self.clock_domains.cd_sys4x_dqs = ClockDomain(reset_less=True)
        self.clock_domains.cd_idelay    = ClockDomain()
        self.clock_domains.cd_native    = ClockDomain(reset_less=True) # 48MHz native, non-reset'ed (for power-on long delay, never reset, we don't want the delay after a warm reset)
        self.clock_domains.cd_cpu      = ClockDomain() # CPU clock, reset'ed by PDS
        if (goblin):
            self.clock_domains.cd_hdmi      = ClockDomain()
            self.clock_domains.cd_hdmi5x    = ClockDomain()
            

        # # #
        clk48 = platform.request("clk48")
        ###### explanations from betrusted-io/betrusted-soc/betrusted_soc.py
        # Note: below feature cannot be used because Litex appends this *after* platform commands! This causes the generated
        # clock derived constraints immediately below to fail, because .xdc file is parsed in-order, and the main clock needs
        # to be created before the derived clocks. Instead, we use the line afterwards.
        platform.add_platform_command("create_clock -name clk48 -period 20.8333 [get_nets clk48]")
        # The above constraint must strictly proceed the below create_generated_clock constraints in the .XDC file
        # This allows PLLs/MMCMEs to be placed anywhere and reference the input clock
        self.clk48_bufg = Signal()
        self.specials += Instance("BUFG", i_I=clk48, o_O=self.clk48_bufg)
        self.comb += self.cd_native.clk.eq(self.clk48_bufg)                
        #self.cd_native.clk = clk48
        
        clk_cpu = platform.request("cpuclk_3v3_n")
        if (clk_cpu is None):
            print(" ***** ERROR ***** Can't find the CPU Clock !!!!\n");
            assert(false)
        self.cd_cpu.clk = clk_cpu
        rst_cpu_n = platform.request("reset_3v3_n")
        self.comb += self.cd_cpu.rst.eq(~rst_cpu_n)
        platform.add_platform_command("create_clock -name cpu_clk -period 40.0 -waveform {{0.0 20.0}} [get_ports clk_3v3_n]") # fixme: pretend it's 25 MHz for now

        num_adv = 0
        num_clk = 0

        self.submodules.pll = pll = S7MMCM(speedgrade=platform.speedgrade)
        #pll.register_clkin(clk48, 48e6)
        pll.register_clkin(self.clk48_bufg, 48e6)
        pll.create_clkout(self.cd_sys,       sys_clk_freq)
        platform.add_platform_command("create_generated_clock -name sysclk [get_pins {{{{MMCME2_ADV/CLKOUT{}}}}}]".format(num_clk))
        num_clk = num_clk + 1
        pll.create_clkout(self.cd_sys4x,     4*sys_clk_freq)
        platform.add_platform_command("create_generated_clock -name sys4xclk [get_pins {{{{MMCME2_ADV/CLKOUT{}}}}}]".format(num_clk))
        num_clk = num_clk + 1
        pll.create_clkout(self.cd_sys4x_dqs, 4*sys_clk_freq, phase=90)
        platform.add_platform_command("create_generated_clock -name sys4x90clk [get_pins {{{{MMCME2_ADV/CLKOUT{}}}}}]".format(num_clk))
        num_clk = num_clk + 1
            
        self.comb += pll.reset.eq(~rst_cpu_n) # | ~por_done 
        platform.add_false_path_constraints(clk48, self.cd_cpu.clk) # FIXME?
        platform.add_false_path_constraints(self.cd_cpu.clk, clk48) # FIXME?
        #platform.add_false_path_constraints(self.cd_sys.clk, self.cd_cpu.clk)
        #platform.add_false_path_constraints(self.cd_cpu.clk, self.cd_sys.clk)
        ##platform.add_false_path_constraints(self.cd_native.clk, self.cd_sys.clk)

        num_adv = num_adv + 1
        num_clk = 0

        self.submodules.pll_idelay = pll_idelay = S7MMCM(speedgrade=platform.speedgrade)
        #pll_idelay.register_clkin(clk48, 48e6)
        pll_idelay.register_clkin(self.clk48_bufg, 48e6)
        pll_idelay.create_clkout(self.cd_idelay, 200e6, margin = 0)
        platform.add_platform_command("create_generated_clock -name idelayclk [get_pins {{{{MMCME2_ADV_{}/CLKOUT{}}}}}]".format(num_adv, num_clk))
        num_clk = num_clk + 1
        self.comb += pll_idelay.reset.eq(~rst_cpu_n) # | ~por_done
        self.submodules.idelayctrl = S7IDELAYCTRL(self.cd_idelay)
        num_adv = num_adv + 1
        num_clk = 0

        self.locked = locked = Signal()
        
        if (goblin):
            self.submodules.video_pll = video_pll = S7MMCM(speedgrade=platform.speedgrade)
            video_pll.register_clkin(self.clk48_bufg, 48e6)

            video_pll.create_clkout(self.cd_hdmi,   pix_clk, margin = 0.005)
            video_pll.create_clkout(self.cd_hdmi5x, 5*pix_clk, margin = 0.005)
            platform.add_platform_command("create_generated_clock -name hdmi_clk [get_pins {{{{MMCME2_ADV_{}/CLKOUT{}}}}}]".format(num_adv, num_clk))
            num_clk = num_clk + 1
            platform.add_platform_command("create_generated_clock -name hdmi5x_clk [get_pins {{{{MMCME2_ADV_{}/CLKOUT{}}}}}]".format(num_adv, num_clk))
            num_clk = num_clk + 1
                
            self.comb += video_pll.reset.eq(~rst_cpu_n)
            #platform.add_false_path_constraints(self.cd_sys.clk, self.cd_vga.clk)
            platform.add_false_path_constraints(self.cd_sys.clk, video_pll.clkin)
            num_adv = num_adv + 1
            num_clk = 0

            self.comb += [ locked.eq(video_pll.locked & pll_idelay.locked & pll.locked) ]
        else:
            self.comb += [ locked.eq(pll_idelay.locked & pll.locked) ]
            
            
        
class IIsiFPGA(SoCCore):
    def __init__(self, variant, version, sys_clk_freq, goblin, goblin_res, **kwargs):
        print(f"Building IIsiFPGA for board version {version}")
        
        kwargs["cpu_type"] = "None"
        kwargs["integrated_sram_size"] = 0
        kwargs["with_uart"] = False
        kwargs["with_timer"] = False
        
        self.sys_clk_freq = sys_clk_freq
    
        self.platform = platform = ztex213_pds.Platform(variant = variant, version = version)

        use_goblin_alt = True
        if (not use_goblin_alt):
            from VintageBusFPGA_Common.goblin_fb import goblin_rounded_size, Goblin
        else:
            from VintageBusFPGA_Common.goblin_alt_fb import goblin_rounded_size, GoblinAlt

        if (goblin):
            hres = int(goblin_res.split("@")[0].split("x")[0])
            vres = int(goblin_res.split("@")[0].split("x")[1])
            goblin_fb_size = goblin_rounded_size(hres, vres)
            print(f"Reserving {goblin_fb_size} bytes ({goblin_fb_size//1048576} MiB) for the goblin")
        else:
            hres = 0
            vres = 0
            goblin_fb_size = 0
            # litex.soc.cores.video.video_timings.update(goblin_timings)
        
        SoCCore.__init__(self,
                         platform=platform,
                         sys_clk_freq=sys_clk_freq,
                         clk_freq=sys_clk_freq,
                         csr_paging=0x800, #  default is 0x800
                         bus_interconnect = "crossbar",
                         **kwargs)

        # Quoting the doc:
        # * Separate address spaces are reserved for processor access to cards in NuBus slots. For a
        # * device in NuBus slot number s, the address space in 32-bit mode begins at address
        # * $Fs00 0000 and continues through the highest address, $FsFF FFFF (where s is a constant in
        # * the range $9 through $E for the Macintosh II, the Macintosh IIx, and the Macintosh IIfx;
        # * $A through $E for the Macintosh Quadra 900; $9 through $B for the Macintosh IIcx;
        # * $C through $E for the Macintosh IIci; $D and $E for the Macintosh Quadra 700; and
        # * $9 for the Macintosh IIsi).
        # the Q650 is $C through $E like the IIci, $E is the one with the PDS.
        # So at best we get 16 MiB in 32-bits mode, unless using "super slot space"
        # in 24 bits it's only one megabyte,  $s0 0000 through $sF FFFF
        # they are translated: '$s0 0000-$sF FFFF' to '$Fs00 0000-$Fs0F FFFF' (for s in range $9 through $E)
        # let's assume we have 32-bits mode, this can be requested in the DeclROM apparently
        # PDS pseudo-slot same as NuBus, but we will always be $9 in IIsi
        self.wb_mem_map = wb_mem_map = {
            # master to map the NuBus access to RAM
            "master":            0x00000000, # to 0x3FFFFFFF
            "main_ram":          0x80000000, # not directly reachable from NuBus
            "video_framebuffer": 0x80000000 + 0x10000000 - goblin_fb_size, # Updated later
            # map everything in slot 0, remapped from the real slot in NuBus2Wishbone
            "goblin_mem":        0xF0000000, # up to 8 MiB of FB memory
            #"END OF FIRST MB" :  0xF00FFFFF,
            #"END OF 8 MB":       0xF07FFFFF,
            "goblin_bt" :        0xF0900000, # BT for goblin (regs)
            "goblin_accel" :     0xF0901000, # accel for goblin (regs)
            "goblin_accel_ram" : 0xF0902000, # accel for goblin (scratch ram)
            "stat"             : 0xF0903000, # stat
            "goblin_accel_rom" : 0xF0910000, # accel for goblin (rom)
            "goblin_audio_ram" : 0xF0920000, # audio for goblin (RAM buffers)
            "csr" :              0xF0A00000, # CSR
            "pingmaster":        0xF0B00000,
            "ethmac":            0xF0C00000,
            "rom":               0xF0FF8000, # ROM at the end (32 KiB of it ATM)
            #"END OF SLOT SPACE": 0xF0FFFFFF,
        }
        self.mem_map.update(wb_mem_map)
        self.submodules.crg = _CRG(platform=platform, version=version, sys_clk_freq=sys_clk_freq, goblin=goblin, pix_clk=litex.soc.cores.video.video_timings[goblin_res]["pix_clk"])

        ## add our custom timings after the clocks have been defined
        xdc_timings_filename = None;

        if (xdc_timings_filename != None):
            xdc_timings_file = open(xdc_timings_filename)
            
            xdc_timings_lines = xdc_timings_file.readlines()
            for line in xdc_timings_lines:
                if (line[0:3] == "set"):
                    fix_line = line.strip().replace("{", "{{").replace("}", "}}")
                    #print(fix_line)
                    platform.add_platform_command(fix_line)

        rom_file = "rom_{}.bin".format(version.replace(".", "_"))
        rom_data = soc_core.get_mem_data(filename_or_regions=rom_file, endianness="little") # "big"
        # rom = Array(rom_data)
        #print("\n****************************************\n")
        #for i in range(len(rom)):
        #    print(hex(rom[i]))
        #print("\n****************************************\n")
        self.add_ram("rom", origin=self.mem_map["rom"], size=2**15, contents=rom_data, mode="r") ## 32 KiB, must match mmap

        #from wb_test import WA2D
        #self.submodules.wa2d = WA2D(self.platform)
        #self.bus.add_slave("WA2D", self.wa2d.bus, SoCRegion(origin=0x00C00000, size=0x00400000, cached=False))

        # notsimul to signify we're making a real bitstream
        # notsimul == False only to produce a verilog implementation to simulate the bus side of things
        notsimul = False
        if (notsimul):
            avail_sdram = 0
            self.submodules.ddrphy = s7ddrphy.A7DDRPHY(platform.request("ddram"),
                                                       memtype        = "DDR3",
                                                       nphases        = 4,
                                                       sys_clk_freq   = sys_clk_freq)
            self.add_sdram("sdram",
                           phy           = self.ddrphy,
                           module        = MT41J128M16(sys_clk_freq, "1:4"),
                           l2_cache_size = 0,
            )
            avail_sdram = self.bus.regions["main_ram"].size
            #from sdram_init import DDR3FBInit
            #self.submodules.sdram_init = DDR3FBInit(sys_clk_freq=sys_clk_freq, bitslip=1, delay=25)
            #self.bus.add_master(name="DDR3Init", master=self.sdram_init.bus)
        else:
            avail_sdram = 256 * 1024 * 1024
            #self.add_ram("ram", origin=0x8f800000, size=2**16, mode="rw")
            self.add_ram("ram", origin=0x00000000, size=2**16, mode="rw")

        if (not notsimul): # otherwise we have no CSRs and litex doesn't like that
            self.submodules.leds = ClockDomainsRenamer("cpu")(LedChaser(
                pads         = platform.request_all("user_led"),
                sys_clk_freq = 25e6))
            self.add_csr("leds")

        base_fb = self.wb_mem_map["main_ram"] + avail_sdram - 1048576 # placeholder
        if (goblin):
            if (avail_sdram >= goblin_fb_size):
                avail_sdram = avail_sdram - goblin_fb_size
                base_fb = self.wb_mem_map["main_ram"] + avail_sdram
                self.wb_mem_map["video_framebuffer"] = base_fb
                print(f"FrameBuffer base_fb @ {base_fb:x}")
            else:
                print("***** ERROR ***** Can't have a FrameBuffer without main ram\n")
                assert(False)
    
        # don't enable anything on the NuBus side for XX seconds after power up
        # this avoids FPGA initialization messing with the cold boot process
        # requires us to reset the Macintosh afterward so the FPGA board
        # is properly identified
        # This is in the 'native' ClockDomain that is never reset
        # not needed, FPGA initializes fast enough, works on cold boots
        #hold_reset_ctr = Signal(30, reset=960000000)
        hold_reset_ctr = Signal(3, reset=7)
        self.sync.native += If(hold_reset_ctr>0, hold_reset_ctr.eq(hold_reset_ctr - 1))
        hold_reset = Signal()
        self.comb += hold_reset.eq(~(hold_reset_ctr == 0))
        halt_n = platform.request("halt_3v3_n")
        self.comb += [ halt_n.eq(~hold_reset & self.crg.locked) ] # release the 68030 only when everything's fine
        #pad_nubus_oe = platform.request("nubus_oe")
        #self.comb += pad_nubus_oe.eq(hold_reset)
        #pad_user_led_0 = platform.request("user_led", 0)
        #self.comb += pad_user_led_0.eq(~hold_reset)

        # Interface PDS to wishbone
        # we need to cross clock domains
        
        irq_line = self.platform.request("irq1_3v3_n") # active low
        fb_irq = Signal(reset = 1) # active low
        audio_irq = Signal(reset = 1) # active low
        self.comb += irq_line.eq(fb_irq & audio_irq) # active low, enable if one is lows
            
        wishbone_master_sys = wishbone.Interface(data_width=self.bus.data_width)
        self.submodules.wishbone_master_pds = WishboneDomainCrossingMaster(platform=self.platform, slave=wishbone_master_sys, cd_master="cpu", cd_slave="sys")
        self.bus.add_master(name="PDSBridgeToWishbone", master=wishbone_master_sys)
        
        wishbone_writemaster_sys = wishbone.Interface(data_width=self.bus.data_width)
        self.submodules.wishbone_writemaster_pds = WishboneDomainCrossingMaster(platform=self.platform, slave=wishbone_writemaster_sys, cd_master="cpu", cd_slave="sys")
        self.bus.add_master(name="PDSBridgeToWishbone_Write", master=wishbone_writemaster_sys)
        
        print(f"Adding the PDS bridge")
        import mc68030_fsm
        self.submodules.mc68030busbridge = mc68030_fsm.MC68030_SYNC_FSM(soc=self,
                                                                        wb_read=self.wishbone_master_pds,
                                                                        wb_write=self.wishbone_writemaster_pds, # somewhat redundant to use two interface, but we'll be moving to FIFO eventually
                                                                        cd_cpu="cpu")
        if (goblin):
            if (not use_goblin_alt):
                self.submodules.videophy = VideoS7HDMIPHY(platform.request("hdmi"), clock_domain="hdmi")
                self.submodules.goblin = Goblin(soc=self, phy=self.videophy, timings=goblin_res, clock_domain="hdmi", irq_line=fb_irq, endian="little", hwcursor=False, truecolor=True) # clock_domain for the HDMI side, goblin is running in cd_sys
            else:
                # GoblinAlt contains its own PHY
                self.submodules.goblin = GoblinAlt(soc=self, timings=goblin_res, clock_domain="hdmi", irq_line=fb_irq, endian="little", hwcursor=False, truecolor=True)
                # it also has a bus master so that the audio bit can fetch data from Wishbone
                self.bus.add_master(name="GoblinAudio", master=self.goblin.goblin_audio.busmaster)
                self.add_ram("goblin_audio_ram", origin=self.mem_map["goblin_audio_ram"], size=2**13, mode="rw") # 8 KiB buffer, planned as 2*4KiB
                self.comb += [ audio_irq.eq(self.goblin.goblin_audio.irq), ]
                
            self.bus.add_slave("goblin_bt", self.goblin.bus, SoCRegion(origin=self.mem_map.get("goblin_bt", None), size=0x1000, cached=False))
            #pad_user_led_0 = platform.request("user_led", 0)
            #pad_user_led_1 = platform.request("user_led", 1)
            #self.comb += pad_user_led_0.eq(self.goblin.video_framebuffer.underflow)
            #self.comb += pad_user_led_1.eq(self.goblin.video_framebuffer.fb_dma.enable)
            if (True):
                self.submodules.goblin_accel = GoblinAccelNuBus(soc = self)
                self.bus.add_slave("goblin_accel", self.goblin_accel.bus, SoCRegion(origin=self.mem_map.get("goblin_accel", None), size=0x1000, cached=False))
                self.bus.add_master(name="goblin_accel_r5_i", master=self.goblin_accel.ibus)
                self.bus.add_master(name="goblin_accel_r5_d", master=self.goblin_accel.dbus)
                goblin_rom_file = "VintageBusFPGA_Common/blit_goblin_nubus.raw"
                goblin_rom_data = soc_core.get_mem_data(filename_or_regions=goblin_rom_file, endianness="little")
                goblin_rom_len = 4*len(goblin_rom_data);
                rounded_goblin_rom_len = 2**log2_int(goblin_rom_len, False)
                print(f"GOBLIN ROM is {goblin_rom_len} bytes, using {rounded_goblin_rom_len}")
                assert(rounded_goblin_rom_len <= 2**16)
                self.add_ram("goblin_accel_rom", origin=self.mem_map["goblin_accel_rom"], size=rounded_goblin_rom_len, contents=goblin_rom_data, mode="r")
                self.add_ram("goblin_accel_ram", origin=self.mem_map["goblin_accel_ram"], size=2**12, mode="rw")
        
def main():
    parser = argparse.ArgumentParser(description="IIsiFPGA")
    parser.add_argument("--build", action="store_true", help="Build bitstream")
    parser.add_argument("--variant", default="ztex2.13a", help="ZTex board variant (default ztex2.13a)")
    parser.add_argument("--version", default="V1.0", help="IIsiFPGA board version (default V1.0)")
    parser.add_argument("--sys-clk-freq", default=100e6, help="IIsiFPGA system clock (default 100e6 = 100 MHz)")
    parser.add_argument("--goblin", action="store_true", help="add a goblin framebuffer")
    parser.add_argument("--goblin-res", default="640x480@60Hz", help="Specify the goblin resolution")
    builder_args(parser)
    vivado_build_args(parser)
    args = parser.parse_args()
    
    soc = IIsiFPGA(**soc_core_argdict(args),
                   variant=args.variant,
                   version=args.version,
                   sys_clk_freq=int(float(args.sys_clk_freq)),
                   goblin=args.goblin,
                   goblin_res=args.goblin_res)

    version_for_filename = args.version.replace(".", "_")

    soc.platform.name += "_" + version_for_filename
    
    builder = Builder(soc, **builder_argdict(args))
    builder.build(**vivado_build_argdict(args), run=args.build)

    # Generate modified CSR registers definitions/access functions to netbsd_csr.h.
    # should be split per-device (and without base) to still work if we have identical devices in different configurations on multiple boards
    # now it is split

    #csr_contents_dict = nubus_to_fpga_export.get_csr_header_split(
    #    regions   = soc.csr_regions,
    #    constants = soc.constants,
    #    csr_base  = soc.mem_regions['csr'].origin)
    #for name in csr_contents_dict.keys():
    #    write_to_file(os.path.join("iisifpga_csr_{}.h".format(name)), csr_contents_dict[name])
    
if __name__ == "__main__":
    main()
