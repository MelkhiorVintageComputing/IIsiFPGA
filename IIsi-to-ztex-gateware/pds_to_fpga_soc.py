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
import trenz0710_pds
import nubus_to_fpga_export

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
from VintageBusFPGA_Common.MacPeriphSoC import *

# CRG ----------------------------------------------------------------------------------------------
class _CRG(Module, AutoCSR):
    def __init__(self, platform, version, sys_clk_freq,
                 goblin=False,
                 pix_clk=0, doIIfx=False):
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
        board_clk_freq=0.0
        board_clk = None
        clk54 = None
        self.board_clk_bufg = Signal()
        if (version == "V1.0"):
            board_clk = platform.request("clk48")
            board_clk_freq = 48e6
            ###### explanations from betrusted-io/betrusted-soc/betrusted_soc.py
            # Note: below feature cannot be used because Litex appends this *after* platform commands! This causes the generated
            # clock derived constraints immediately below to fail, because .xdc file is parsed in-order, and the main clock needs
            # to be created before the derived clocks. Instead, we use the line afterwards.
            platform.add_platform_command("create_clock -name clk48 -period 20.8333 [get_nets clk48]")
            # The above constraint must strictly proceed the below create_generated_clock constraints in the .XDC file
            # This allows PLLs/MMCMEs to be placed anywhere and reference the input clock
            self.specials += Instance("BUFG", i_I=board_clk, o_O=self.board_clk_bufg)
            self.comb += self.cd_native.clk.eq(self.board_clk_bufg)                
            #self.cd_native.clk = board_clk
        elif (version == "V2.0"):
            board_clk = platform.request("clk100")
            board_clk_freq = 100e6
            platform.add_platform_command("create_clock -name clk100 -period 10.0 [get_nets clk100]")
            self.specials += Instance("BUFG", i_I=board_clk, o_O=self.board_clk_bufg)
            self.comb += self.cd_native.clk.eq(self.board_clk_bufg)

            ##### V2.0 extra clock for B34
            self.clock_domains.cd_bank34      = ClockDomain()
            clk54 = platform.request("clk54")
            platform.add_platform_command("create_clock -name clk54 -period 18.51851851851851851 [get_nets clk54]")
            self.clk54_bufg = Signal()
            self.specials += Instance("BUFG", i_I=clk54, o_O=self.clk54_bufg)
            self.comb += self.cd_bank34.clk.eq(self.clk54_bufg)
        else:
             assert(False)   

        if (doIIfx):
            clk_cpu = platform.request("c16m_3v3_n") # called c16m but it's the (slowed) 20 MHz CPU clock, theoretically we could double it to 40 MHz and use area $7 for higher speed...
        else:
            clk_cpu = platform.request("cpuclk_3v3_n")
        if (clk_cpu is None):
            print(" ***** ERROR ***** Can't find the CPU Clock !!!!\n");
            assert(false)
        self.cd_cpu.clk = clk_cpu
        rst_cpu_n = platform.request("reset_3v3_n")
        self.comb += self.cd_cpu.rst.eq(~rst_cpu_n)
        
        if (doIIfx):
            platform.add_platform_command("create_clock -name cpu_clk -period 40.0 -waveform {{0.0 20.0}} [get_ports c16m_3v3_n]") # fixme: pretend it's 25 MHz for now
        else:
            platform.add_platform_command("create_clock -name cpu_clk -period 40.0 -waveform {{0.0 20.0}} [get_ports cpuclk_3v3_n]") # fixme: pretend it's 25 MHz for now
        
        #led = platform.request("user_led", 0)
        #self.comb += [ led.eq(~rst_cpu_n) ]

        num_adv = 0
        num_clk = 0

        self.submodules.pll = pll = S7MMCM(speedgrade=platform.speedgrade)
        #pll.register_clkin(board_clk, board_clk_freq)
        pll.register_clkin(self.board_clk_bufg, board_clk_freq)
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
        platform.add_false_path_constraints(board_clk, self.cd_cpu.clk) # FIXME?
        platform.add_false_path_constraints(self.cd_cpu.clk, board_clk) # FIXME?
        #platform.add_false_path_constraints(self.cd_sys.clk, self.cd_cpu.clk)
        #platform.add_false_path_constraints(self.cd_cpu.clk, self.cd_sys.clk)
        ##platform.add_false_path_constraints(self.cd_native.clk, self.cd_sys.clk)

        num_adv = num_adv + 1
        num_clk = 0

        self.submodules.pll_idelay = pll_idelay = S7MMCM(speedgrade=platform.speedgrade)
        #pll_idelay.register_clkin(board_clk, board_clk_freq)
        pll_idelay.register_clkin(self.board_clk_bufg, board_clk_freq)
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
            if (clk54 is None):
                # no 54 MHz clock, drive hdmi from the main clock
                video_pll.register_clkin(self.board_clk_bufg, board_clk_freq)
            else:
                # drive hdmi from the 54 MHz clock, easier to generate e.g. 148.5 MHz
                video_pll.register_clkin(self.clk54_bufg, 54e6)
                platform.add_false_path_constraints(self.cd_bank34.clk, board_clk) # FIXME?
                platform.add_false_path_constraints(self.cd_bank34.clk, self.cd_cpu.clk) # FIXME?

            video_pll.create_clkout(self.cd_hdmi,   pix_clk, margin = 0.005)
            video_pll.create_clkout(self.cd_hdmi5x, 5*pix_clk, margin = 0.005)
            platform.add_platform_command("create_generated_clock -name hdmi_clk [get_pins {{{{MMCME2_ADV_{}/CLKOUT{}}}}}]".format(num_adv, num_clk))
            num_clk = num_clk + 1
            platform.add_platform_command("create_generated_clock -name hdmi5x_clk [get_pins {{{{MMCME2_ADV_{}/CLKOUT{}}}}}]".format(num_adv, num_clk))
            num_clk = num_clk + 1
            video_pll.expose_drp()
                
            self.comb += video_pll.reset.eq(~rst_cpu_n)
            #platform.add_false_path_constraints(self.cd_sys.clk, self.cd_vga.clk)
            platform.add_false_path_constraints(self.cd_sys.clk, video_pll.clkin)
            num_adv = num_adv + 1
            num_clk = 0

            self.comb += [ locked.eq(video_pll.locked & pll_idelay.locked & pll.locked) ]
        else:
            self.comb += [ locked.eq(pll_idelay.locked & pll.locked) ]
            
            
        
class IIsiFPGA(MacPeriphSoC):
    def __init__(self, variant, version, sys_clk_freq, config_flash, goblin, goblin_res, use_goblin_alt, rd68891, rd68883, doIIfx, **kwargs):
        print(f"Building IIsiFPGA for board version {version}")

        platform = None
        if (version == "V1.0"):
            platform = ztex213_pds.Platform(variant = variant, version = version)
        elif (version == "V2.0"):
            platform = trenz0710_pds.Platform(variant = variant, version = version)
            
        self.platform = platform

        if (doIIfx):
            platform.add_extension(ztex213_pds._pds_pdsmaster_v1_0)
        else:
            platform.add_extension(ztex213_pds._pds_pdsled_v1_0)

        hdmi = True
        
        MacPeriphSoC.__init__(self,
                              platform=platform,
                              sys_clk_freq=sys_clk_freq,
                              csr_paging=0x800, #  default is 0x800
                              bus_interconnect = "crossbar",
                              goblin = goblin,
                              hdmi = hdmi,
                              goblin_res = goblin_res,
                              use_goblin_alt = use_goblin_alt,
                              **kwargs)

        self.mem_map.update(self.wb_mem_map)
        
        self.submodules.crg = _CRG(platform=platform, version=version, sys_clk_freq=sys_clk_freq, goblin=goblin, pix_clk=litex.soc.cores.video.video_timings[goblin_res]["pix_clk"], doIIfx=doIIfx)

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

        MacPeriphSoC.mac_add_declrom(self, version = version, flash = False, config_flash = config_flash)
        
        MacPeriphSoC.mac_add_sdram(self,
                                   hwinit = True,
                                   sdram_dfii_base = 0xf0a02800,
                                   ddrphy_base = 0xf0a01800,
                                   version = version) # FIXME: can we get the appropriate value here ??? or are they only available after finalize ???
        
        if (goblin):
            MacPeriphSoC.mac_add_goblin_prelim(self)
    
        # don't enable anything on the NuBus side for XX seconds after power up
        # this avoids FPGA initialization messing with the cold boot process
        # requires us to reset the Macintosh afterward so the FPGA board
        # is properly identified
        # This is in the 'native' ClockDomain that is never reset
        # not needed, FPGA initializes fast enough, works on cold boots
        #hold_reset_ctr = Signal(30, reset=960000000)
        hold_reset_ctr = Signal(3, reset=7)
        #hold_reset_ctr = Signal(30, reset=96000000) #two seconds
        self.sync.native += If((hold_reset_ctr>0), hold_reset_ctr.eq(hold_reset_ctr - 1))
        ###good_to_go = Signal()
        ###self.comb += [ good_to_go.eq((hold_reset_ctr == 0) & self.crg.locked & self.sdram_init.done) ]
        hold_reset = Signal()
        self.comb += [ hold_reset.eq(~(hold_reset_ctr == 0) | ~self.crg.locked | ~self.sdram_init.done) ]
        halt_n = platform.request("halt_3v3_n")
        self.comb += [ halt_n.eq(~hold_reset) ] # release the 68030 only when everything's fine
        #self.comb += [ halt_n.eq(1) ] # release the 68030 only when everything's fine

        #led = platform.request("led0") # pmod56- / irq2, external led for now
        #self.comb += [ led.eq(halt_n) ]
        
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
        #self.submodules.wishbone_writemaster_pds = WishboneDomainCrossingMaster(platform=self.platform, slave=wishbone_writemaster_sys, cd_master="cpu", cd_slave="sys")
        self.bus.add_master(name="PDSBridgeToWishbone_Write", master=wishbone_writemaster_sys)

        if (False):
            wb_forziscreen = wishbone.Interface(data_width=self.bus.data_width)
            from VintageBusFPGA_Common.Ziscreen import Ziscreen
            self.submodules.ziscreen_fifo = ClockDomainsRenamer({"read": "sys", "write": "cpu"})(AsyncFIFOBuffered(width=32, depth=1024))
            self.submodules.ziscreen = Ziscreen(platform=platform, wb=wb_forziscreen, fifo=self.ziscreen_fifo)
            self.bus.add_master(name="instscreentrace", master=wb_forziscreen)
        else:    
            self.ziscreen_fifo = None
        
        print(f"Adding the PDS bridge")
        import mc68030_fsm
        self.submodules.mc68030busbridge = mc68030_fsm.MC68030_SYNC_FSM(soc=self,
                                                                        wb_read=self.wishbone_master_pds,
                                                                        #wb_write=self.wishbone_writemaster_pds,
                                                                        wb_write=wishbone_writemaster_sys,
                                                                        dram_native_r=self.sdram.crossbar.get_port(mode="read", data_width=128, clock_domain="cpu"),
                                                                        cd_cpu="cpu",
                                                                        trace_inst_fifo=self.ziscreen_fifo,
                                                                        rd68891 = rd68891,
                                                                        rd68883 = rd68883,
                                                                        slot = 0xE if doIIfx else 0x9,)
        if (goblin):
            MacPeriphSoC.mac_add_goblin(self, use_goblin_alt = use_goblin_alt, hdmi = hdmi, goblin_res = goblin_res, goblin_irq = fb_irq, audio_irq = audio_irq)

        if (False):
            wb_forzscreen = wishbone.Interface(data_width=self.bus.data_width)
            from VintageBusFPGA_Common.Zscreen import Zscreen
            self.submodules.zscreen = Zscreen(platform=platform, wb=wb_forzscreen)
            self.bus.add_master(name="screentrace", master=wb_forzscreen)
        
def main():
    parser = argparse.ArgumentParser(description="IIsiFPGA")
    parser.add_argument("--build", action="store_true", help="Build bitstream")
    parser.add_argument("--variant", default="ztex2.13a", help="ZTex/Trenz board variant (default ztex2.13a)")
    parser.add_argument("--version", default="V1.0", help="IIsiFPGA board version (default V1.0)")
    parser.add_argument("--sys-clk-freq", default=100e6, help="IIsiFPGA system clock (default 100e6 = 100 MHz)")
    parser.add_argument("--config-flash", action="store_true", help="Configure the ROM to the internal Flash used for FPGA config")
    parser.add_argument("--goblin", action="store_true", help="add a goblin framebuffer")
    parser.add_argument("--goblin-res", default="1920x1080@60Hz", help="Specify the goblin resolution")
    parser.add_argument("--goblin-alt", action="store_true", help="Use alternate HDMI Phy with Audio support (requires Full HD resolution)")
    parser.add_argument("--doIIfx", action="store_true", help="Generate the design for a Macintosh IIfx instead of a IIsi or SE/30")
    parser.add_argument("--rd68891", action="store_true", help="Add a RD68891 coprocessor (unfinished)")
    parser.add_argument("--rd68883", action="store_true", help="Add a RD68883 coprocessor (barely started)")
    builder_args(parser)
    vivado_build_args(parser)
    args = parser.parse_args()

    if (args.goblin_alt and (args.goblin_res != "1920x1080@60Hz")):
        print(" ***** ERROR ***** : Goblin Alt PHY currently only supports Full HD\n");
        assert(False)

    if (True):
        f = open("decl_rom_config.mak","w+")
        hres = int(args.goblin_res.split("@")[0].split("x")[0])
        vres = int(args.goblin_res.split("@")[0].split("x")[1])
        f.write("TARGET=IISIFPGA\n")
        f.write("FEATURES+= -DIISIFPGA")
        # f.write(" -DENABLE_RAMDSK") # only NuBusFPGA for now
        if (args.goblin_alt):
            f.write(" -DENABLE_HDMIAUDIO") # no audio in litex-style not-hdmi phy
        else:
            f.write(" -DENABLE_HDMI_ALT_CHANGE");
            if (args.version == "V1.0"):
                f.write(" -DENABLE_HDMI_ALT_CHANGE_48MHZ")
            elif (args.version == "V2.0"):
                f.write(" -DENABLE_HDMI_ALT_CHANGE_54MHZ")
                
        f.write("\n")
        f.write(f"HRES={hres}\n")
        f.write(f"VRES={vres}\n")
        f.close()

    if (True):
        f = open("board.inc", "w+")
        if (args.doIIfx):
            f.write(f"            .string        \"IIsiFPGA {args.version} (IIfx)\\0\"        /*  revision level */")
        else:
            f.write(f"            .string        \"IIsiFPGA {args.version}\\0\"        /*  revision level */")
        f.close()
        
    soc = IIsiFPGA(**soc_core_argdict(args),
                   variant=args.variant,
                   version=args.version,
                   sys_clk_freq=int(float(args.sys_clk_freq)),
                   config_flash=args.config_flash,
                   goblin=args.goblin,
                   goblin_res=args.goblin_res,
                   use_goblin_alt=args.goblin_alt,
                   rd68891=args.rd68891,
                   rd68883=args.rd68883,
                   doIIfx=args.doIIfx,
    )

    version_for_filename = args.version.replace(".", "_")

    soc.platform.name += "_" + version_for_filename
    
    builder = Builder(soc, **builder_argdict(args))
    builder.build(**vivado_build_argdict(args), run=args.build)

    # Generate modified CSR registers definitions/access functions to netbsd_csr.h.
    # should be split per-device (and without base) to still work if we have identical devices in different configurations on multiple boards
    # now it is split

    csr_contents_dict = nubus_to_fpga_export.get_csr_header_split(
        regions   = soc.csr_regions,
        constants = soc.constants,
        csr_base  = soc.mem_regions['csr'].origin)
    for name in csr_contents_dict.keys():
        write_to_file(os.path.join("iisifpga_csr_{}.h".format(name)), csr_contents_dict[name])

    if (args.doIIfx):
        print("---------------------------------------------------------------------------------------------") 
        print("------------- Configured for a Macintosh IIfx, check the switch !!! -------------------------") 
        print("---------------------------------------------------------------------------------------------") 
    
if __name__ == "__main__":
    main()
