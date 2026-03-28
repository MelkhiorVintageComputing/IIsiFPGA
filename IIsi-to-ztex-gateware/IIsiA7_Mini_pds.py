#
# Copyright (c) 2026 Romain Dolbeau <romain@dolbeau.org>
# SPDX-License-Identifier: BSD-2-Clause

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform
from litex.build.openocd import OpenOCD

# IOs ----------------------------------------------------------------------------------------------

_io = [
    ## 100 MHz clock reference
    # default value, depend on the board
    ("clk100", 0, Pins("N14"), IOStandard("LVCMOS33")),
    ## 54 Mhz clock reference
    # default value, depend on the board
    ("clk54", 0, Pins("D13"), IOStandard("LVCMOS33")),

    ## User leds
    # active-high, from Bank 35 (the one with DDR2)
    ("user_leds", 0, Pins("D4 D6"),  IOStandard("LVCMOS18")), # left, bottom/top
    ("user_leds", 1, Pins("E6 K5"),  IOStandard("LVCMOS18")), # bottom, left/rigth
    
    ## embedded xxx MiB DDR2 DRAM
    # has all 14 address its wired (max 2 GBit), but the actual part on the board might be smaller
    ("ddram", 0,
        Subsignal("a", Pins(
            "H5 J4 H1 K2 F2 K1 H2 L2 G2 K3 J5 H4 L3 G1"),
            IOStandard("SSTL18_II")),
        Subsignal("ba",    Pins("G5 J1 F5"), IOStandard("SSTL18_II")),
        Subsignal("ras_n", Pins("G4"), IOStandard("SSTL18_II")),
        Subsignal("cas_n", Pins("E1"), IOStandard("SSTL18_II")),
        Subsignal("we_n",  Pins("F4"), IOStandard("SSTL18_II")),
        Subsignal("dm", Pins("B2 B7"), IOStandard("SSTL18_II")),
        Subsignal("dq", Pins(
            "D1 C2 E2 E3 C4 D3 A2 C3 ",
            "A3 C7 C6 B5 B6 D5 A7 B4 "),
            IOStandard("SSTL18_II"),
            Misc("IN_TERM=UNTUNED_SPLIT_50")),
        Subsignal("dqs_p", Pins("C1 A5"),
                  IOStandard("DIFF_SSTL18_II"),
                  Misc("IN_TERM=UNTUNED_SPLIT_50")), # CHECKME
        Subsignal("dqs_n", Pins("B1 A4"),
                  IOStandard("DIFF_SSTL18_II"),
                  Misc("IN_TERM=UNTUNED_SPLIT_50")), # CHECKME
        Subsignal("clk_p", Pins("J3"), IOStandard("DIFF_SSTL18_II")),
        Subsignal("clk_n", Pins("H3"), IOStandard("DIFF_SSTL18_II")),
        Subsignal("cke",   Pins("E5"), IOStandard("SSTL18_II")),
        Subsignal("odt",   Pins("F3"), IOStandard("SSTL18_II")),
        Misc("SLEW=FAST"),
    ),

    ## Serial
    # CH340N so accessed via USB
    ("serial", 0,
        Subsignal("tx", Pins("D10")),
        Subsignal("rx", Pins("K12")),
        IOStandard("LVCMOS33")
    ),

    ## config flash
    ("config_spiflash4x", 0,
        Subsignal("cs_n", Pins("L12")),
        # Subsignal("clk",  Pins("E8")), # 'E8' isn't a user pin, access clock via STARTUPE2 primitive, disabling the pads should do it in LiteSPIClkGen ?
        Subsignal("dq", Pins("J13 J14 K15 K16")),
        IOStandard("LVCMOS33"),
    ),
    ("config_spiflash", 0,
        Subsignal("cs_n", Pins("L12")),
        IOStandard("LVCMOS33"),
        Subsignal("mosi", Pins("J13")),
        Subsignal("miso", Pins("J14")),
    ),
    
    ## HDMI
    ("hdmi", 0,
        Subsignal("clk_n",   Pins("A14"), IOStandard("TMDS_33")),
        Subsignal("clk_p",   Pins("A13"), IOStandard("TMDS_33")),
        Subsignal("data0_n", Pins("A12"), IOStandard("TMDS_33")),
        Subsignal("data0_p", Pins("B12"), IOStandard("TMDS_33")),
        Subsignal("data1_n", Pins("B11"), IOStandard("TMDS_33")),
        Subsignal("data1_p", Pins("B10"), IOStandard("TMDS_33")),
        Subsignal("data2_n", Pins("A10"), IOStandard("TMDS_33")),
        Subsignal("data2_p", Pins("B9"), IOStandard("TMDS_33")),
        #Subsignal("hpd",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("sda",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("scl",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("cec",     Pins(""), IOStandard("LVCMOS33")),
    ),
]

# PDS
_pds_pds_v3_0 = [
     ("A_3v3",        0, Pins(" M1  M2  L4  N1  L5  N2  P1  M4 "
                              " N3  R1  P3  N4  T2  R2  R3  T3"
                              " M5  P4  T4  P5  M6  T5  R5  N6"
                              " R6  P6  T7  R7  P8  T8  R8  P9 "), IOStandard("lvttl")),
     ("as_3v3_n",     0, Pins("F15"), IOStandard("lvttl")),
     ("berr_3v3_n",   0, Pins("J16"), IOStandard("lvttl")),
     ("bg_3v3_n",     0, Pins("G16"), IOStandard("lvttl")),
     ("bgack_3v3_n",  0, Pins("F13"), IOStandard("lvttl")),
     ("br_3v3_n",     0, Pins("F12"), IOStandard("lvttl")),
     ("c16m_3v3",     0, Pins("N13"), IOStandard("lvttl")),
     ("cache_3v3",    0, Pins("C12"), IOStandard("lvttl"), Misc("PULLDOWN True")),
     ("cback_3v3_n",  0, Pins("E12"), IOStandard("lvttl")),
     ("cbreq_3v3_n",  0, Pins("D15"), IOStandard("lvttl")),
     ("ciout_3v3_n",  0, Pins("C14"), IOStandard("lvttl"), Misc("PULLUP True")),
     ("cpuclk_3v3_n", 0, Pins("N11"), IOStandard("lvttl")),
     ("D_3v3",        0, Pins("J15 H14 H13 H12 M16 H11 N16 K13 "
                              "P16 L14 R16 L13 P15 R15 T15 M14 "
                              "P14 T14 P13 R13 T13 M12 R12 T12 "
                              "N12 R11 P11 R10 T10 P10  N9  T9 "), IOStandard("lvttl")),
     ("ds_3v3_n",     0, Pins("D14"), IOStandard("lvttl")),
     ("dsack_3v3_n",  0, Pins("E13 D16"), IOStandard("lvttl")),
     ("fc_3v3",       0, Pins("G14 H16 G15 "), IOStandard("lvttl")),
     ("halt_3v3_n",   0, Pins("G11"), IOStandard("lvttl")),
     ("irq1_3v3_n",   0, Pins("B16"), IOStandard("lvttl"), Misc("PULLUP True")),
     ("irq2_3v3_n",   0, Pins("C13"), IOStandard("lvttl"), Misc("PULLUP True")),
     ("irq3_3v3_n",   0, Pins("B15"), IOStandard("lvttl"), Misc("PULLUP True")),
     ("rbv_3v3_n",    0, Pins("C11"), IOStandard("lvttl")),
     ("reset_3v3_n",  0, Pins("G12"), IOStandard("lvttl")),
     ("rw_3v3_n",     0, Pins("E15"), IOStandard("lvttl")),
     ("siz_3v3",      0, Pins("F14 E16"), IOStandard("lvttl")),
     ("sterm_3v3_n",  0, Pins("C16"), IOStandard("lvttl")),
     ("tm0a_3v3",     0, Pins("B14"), IOStandard("lvttl")),
     ("tm1a_3v3",     0, Pins("A15"), IOStandard("lvttl")),
    ]

# IO/s
connectors_v3_0 = [
    ("P1", "D11 E11 D9 D8 A9 A8 C9 C8"), # check sequence! currently in pmod-* order
    ]

def diag_leds_pmod_io(pmod):
    return [
        ("diag_leds", 0, Pins(f"{pmod}:0 {pmod}:1 {pmod}:2 {pmod}:3 {pmod}:4 {pmod}:5 {pmod}:6 {pmod}:7"), IOStandard("LVCMOS33")),
]
_diag_leds_pmod_io = diag_leds_pmod_io("P1") # LEDS PMOD

class IIsiA7_Mini(XilinxPlatform):

    def __init__(self, variant="IIsiA7_Mini_A50T-1", version="V3.0", connectors=None):
        # Devices in FTG256 should work from 15T to 50T
        # A75T and A100T have enough decoupling, but might be short on the 1V0 rail
        # Higher speed grade are fine, but but also use up more power
        device = {
            "IIsiA7_Mini_A15T-1":  "xc7a15tftg256-1", # untested
            "IIsiA7_Mini_A35T-1":  "xc7a35tftg256-1", # untested
            "IIsiA7_Mini_A50T-1":  "xc7a50tftg256-1", # untested
            "IIsiA7_Mini_A15T-2":  "xc7a15tftg256-2", # untested
            "IIsiA7_Mini_A35T-2":  "xc7a35tftg256-2", # untested
            "IIsiA7_Mini_A50T-2":  "xc7a50tftg256-2", # untested
            "IIsiA7_Mini_A15T-3":  "xc7a15tftg256-3", # untested
            "IIsiA7_Mini_A35T-3":  "xc7a35tftg256-3", # untested
            "IIsiA7_Mini_A50T-3":  "xc7a50tftg256-3", # untested
        }[variant]
        
        self.speedgrade = -1
        if (device[-1] == '2'):
            self.speedgrade = -2
        if (device[-1] == '3'):
            self.speedgrade = -3
        
        XilinxPlatform.__init__(self, device, _io, connectors, toolchain="vivado")

        self.toolchain.additional_commands = \
            ["write_cfgmem -force -format bin -interface spix4 -size 16 "
             "-loadbit \"up 0x00000000 {build_name}.bit\" "
             "-loaddata \"up 0x00280000 ../../../VintageBusFPGA_Common/DeclROM/vid_decl_rom.bin\" "
             "-file {build_name}.bit.bin "]
        
        self.toolchain.bitstream_commands = \
            ["set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]",
             "set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]",
             "set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]",
             "set_property BITSTREAM.GENERAL.COMPRESS true [current_design]",
             "set_property BITSTREAM.CONFIG.M2PIN PULLNONE [current_design]",
             "set_property BITSTREAM.CONFIG.M1PIN PULLNONE [current_design]",
             "set_property BITSTREAM.CONFIG.M0PIN PULLNONE [current_design]",
             "set_property BITSTREAM.CONFIG.USR_ACCESS TIMESTAMP [current_design]",
             "set_property BITSTREAM.GENERAL.CRC DISABLE [current_design]",
             #"set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]",
             "set_property CONFIG_VOLTAGE 3.3 [current_design]",
             "set_property CONFIG_MODE SPIx4 [current_design]",
             "set_property CFGBVS VCCO [current_design]",
             #             "set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE AreaOptimized_high [get_runs synth_1]",
             ]
        self.add_platform_command("set_property INTERNAL_VREF 0.900 [get_iobanks 35]")

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment)
        #self.add_period_constraint(self.lookup_request("clk48", loose=True), 1e9/48e6)

        
# Platform -----------------------------------------------------------------------------------------

class Platform(IIsiA7_Mini):
    
    def __init__(self, variant="IIsiA7_Mini_A50T-1", version="V3.0"):
        connectors = {
            "V3.0" : connectors_v3_0,
        }[version]
        pds_pds = {
            "V3.0" : _pds_pds_v3_0,
        }[version]
        
        IIsiA7_Mini.__init__(self, variant=variant, version=version, connectors=connectors)
        self.add_extension(pds_pds)
