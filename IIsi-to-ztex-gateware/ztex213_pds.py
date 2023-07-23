#
# This file is part of LiteX-Boards.
#
# Support for the ZTEX USB-FGPA Module 2.13:
# <https://www.ztex.de/usb-fpga-2/usb-fpga-2.13.e.html>
# With (no-so-optional) expansion, either the ZTEX Debug board:
# <https://www.ztex.de/usb-fpga-2/debug.e.html>
# Or the NuBusFPGA adapter board:
# <https://github.com/rdolbeau/NuBusFPGA>
#
# Copyright (c) 2015 Yann Sionneau <yann.sionneau@gmail.com>
# Copyright (c) 2015-2019 Florent Kermarrec <florent@enjoy-digital.fr>
# Copyright (c) 2020-2021 Romain Dolbeau <romain@dolbeau.org>
# SPDX-License-Identifier: BSD-2-Clause

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform
from litex.build.openocd import OpenOCD

# IOs ----------------------------------------------------------------------------------------------

# FPGA daughterboard I/O

_io = [
    ## 48 MHz clock reference
    ("clk48", 0, Pins("P15"), IOStandard("LVCMOS33")),
    ## embedded 256 MiB DDR3 DRAM
    ("ddram", 0,
        Subsignal("a", Pins("C5 B6 C7 D5 A3 E7 A4 C6", "A6 D8 B2 A5 B3 B7"),
            IOStandard("SSTL135")),
        Subsignal("ba",    Pins("E5 A1 E6"), IOStandard("SSTL135")),
        Subsignal("ras_n", Pins("E3"), IOStandard("SSTL135")),
        Subsignal("cas_n", Pins("D3"), IOStandard("SSTL135")),
        Subsignal("we_n",  Pins("D4"), IOStandard("SSTL135")),
#        Subsignal("cs_n",  Pins(""), IOStandard("SSTL135")),
        Subsignal("dm", Pins("G1 G6"), IOStandard("SSTL135")),
        Subsignal("dq", Pins(
            "H1 F1 E2 E1 F4 C1 F3 D2",
            "G4 H5 G3 H6 J2 J3 K1 K2"),
            IOStandard("SSTL135"),
            Misc("IN_TERM=UNTUNED_SPLIT_40")),
        Subsignal("dqs_p", Pins("H2 J4"),
            IOStandard("DIFF_SSTL135"),
            Misc("IN_TERM=UNTUNED_SPLIT_40")),
        Subsignal("dqs_n", Pins("G2 H4"),
            IOStandard("DIFF_SSTL135"),
            Misc("IN_TERM=UNTUNED_SPLIT_40")),
        Subsignal("clk_p", Pins("C4"), IOStandard("DIFF_SSTL135")),
        Subsignal("clk_n", Pins("B4"), IOStandard("DIFF_SSTL135")),
        Subsignal("cke",   Pins("B1"), IOStandard("SSTL135")),
        Subsignal("odt",   Pins("F5"), IOStandard("SSTL135")),
        Subsignal("reset_n", Pins("J5"), IOStandard("SSTL135")),
        Misc("SLEW=FAST"),
    ),
]

# IisiFPGA I/O
# I/O
_pds_io_v1_0 = [
    # HDMI
    ("hdmi", 0,
        Subsignal("clk_p",   Pins("R6"), IOStandard("TMDS_33")),
        Subsignal("clk_n",   Pins("R5"), IOStandard("TMDS_33")),
        Subsignal("data0_p", Pins("U4"), IOStandard("TMDS_33")),
        Subsignal("data0_n", Pins("U3"), IOStandard("TMDS_33")),
        Subsignal("data1_p", Pins("R7"), IOStandard("TMDS_33")),
        Subsignal("data1_n", Pins("T6"), IOStandard("TMDS_33")),
        Subsignal("data2_p", Pins("T5"), IOStandard("TMDS_33")),
        Subsignal("data2_n", Pins("T4"), IOStandard("TMDS_33")),
        #Subsignal("hpd",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("sda",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("scl",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("cec",     Pins(""), IOStandard("LVCMOS33")),
    ),
    #("user_led", 0, Pins("U1"),  IOStandard("lvcmos33")), # pretend LED0, pmod #55
    #("user_led", 1, Pins("V1"),  IOStandard("lvcmos33")), # pretend LED1, pmod #6
    ("user_led", 1, Pins("N6"),  IOStandard("lvcmos33")), # pretend LED0, pmod #11
    ("user_led", 0, Pins("M6"),  IOStandard("lvcmos33")), # pretend LED1, pmod #12
    ("user_led", 3, Pins("N5"),  IOStandard("lvcmos33")), # pretend LED0, pmod #9
    ("user_led", 2, Pins("P5"),  IOStandard("lvcmos33")), # pretend LED1, pmod #10
    ("user_led", 5, Pins("R3"),  IOStandard("lvcmos33")), # pretend LED0, pmod #7
    ("user_led", 4, Pins("T3"),  IOStandard("lvcmos33")), # pretend LED1, pmod #8
    ("user_led", 7, Pins("U1"),  IOStandard("lvcmos33")), # pretend LED0, pmod #5
    ("user_led", 6, Pins("V1"),  IOStandard("lvcmos33")), # pretend LED1, pmod #6
    ]

# PDS
_pds_pds_v1_0 = [
    ("cpuclk_3v3_n",       0, Pins("H16"), IOStandard("lvttl")),
    ("A_3v3",              0, Pins("V9  U9  V7  U8  V6  U7  V5  U6  "
                                   "V4  J18 K16 J17 K15 K13 J15 J13 "
                                   "H15 H14 J14 G14 H17 G16 G17 G18 "
                                   "F16 F18 E18 F15 D18 E17 G13 D17 "), IOStandard("lvttl")),
    ("D_3v3",              0, Pins("R1  A13 M4  B12 C12 T1  B14 B13 "
                                   "N4  A16 A15 P3  D13 D12 L5  C14 "
                                   "D14 P4  B17 B16 L6  C15 D15 A18 "
                                   "B18 C17 C16 E16 E15 F13 F14 K6  "), IOStandard("lvttl")),
    ("cpuclk_3v3_n",       0, Pins("H16"), IOStandard("lvttl")),
    ("reset_3v3_n",        0, Pins("M3"), IOStandard("lvttl")),
    ("berr_3v3_n",         0, Pins("A11"), IOStandard("lvttl")),
    ("cback_3v3_n",        0, Pins("T8"), IOStandard("lvttl")),
    ("cbreq_3v3_n",        0, Pins("R8"), IOStandard("lvttl")),
    ("ciout_3v3_n",        0, Pins("V2"), IOStandard("lvttl")),
    ("cache_3v3",          0, Pins("U2"), IOStandard("lvttl")),
    ("fc_3v3",             0, Pins("B11 R2 M2"), IOStandard("lvttl")),
    ("siz_3v3",            0, Pins("K5 N2"), IOStandard("lvttl")),
    ("rw_3v3_n",           0, Pins("L4"), IOStandard("lvttl")),
    ("dsack_3v3_n",        0, Pins("N1 L3"), IOStandard("lvttl")),
    ("ds_3v3_n",           0, Pins("K3"), IOStandard("lvttl")),
    ("halt_3v3_n",         0, Pins("A14"), IOStandard("lvttl")),
    ("as_3v3_n",           0, Pins("P2"), IOStandard("lvttl")),
    ("sterm_3v3_n",        0, Pins("M1"), IOStandard("lvttl")),
    ("irq1_3v3_n",           0, Pins("L1"), IOStandard("lvttl")),
]

_pds_pdsmaster_v1_0 = [
    ("fpu_3v3_n",          0, Pins("T3"), IOStandard("lvttl")),
    ("bg_3v3_n",           0, Pins("N6"), IOStandard("lvttl")),
    ("br_3v3_n",           0, Pins("M6"), IOStandard("lvttl")),
    ("bgack_3v3_n",        0, Pins("P5"), IOStandard("lvttl")),
    ("c16m_3v3_n",         0, Pins("N5"), IOStandard("lvttl")),
    ("irq2_3v3_n",         0, Pins("U1"), IOStandard("lvttl")),
    ("irq3_3v3_n",         0, Pins("V1"), IOStandard("lvttl")),
    ("rbv_3v3_n",          0, Pins("R3"), IOStandard("lvttl")),

]

# Connectors ---------------------------------------------------------------------------------------
connectors_v1_0 = [
    ("P1", "U1 V1 R3 T3 N5 P5 M6 N6"), # check sequence! currently in pmod-* order
    ]

# Platform -----------------------------------------------------------------------------------------

class Platform(XilinxPlatform):
    default_clk_name   = "clk48"
    default_clk_period = 1e9/48e6

    def __init__(self, variant="ztex2.13a", version="V1.0"):
        device = {
            "ztex2.13a":  "xc7a35tcsg324-1",
            "ztex2.13b":  "xc7a50tcsg324-1", #untested
            "ztex2.13b2": "xc7a50tcsg324-1", #untested
            "ztex2.13c":  "xc7a75tcsg324-2", #untested
            "ztex2.13d":  "xc7a100tcsg324-2" #untested
        }[variant]
        pds_io = {
            "V1.0" : _pds_io_v1_0,
        }[version]
        pds_pds = {
            "V1.0" : _pds_pds_v1_0,
        }[version]
        pds_pdsmaster = {
            "V1.0" : _pds_pdsmaster_v1_0,
        }[version]
        connectors = {
            "V1.0" : connectors_v1_0,
        }[version]
        self.speedgrade = -1
        if (device[-1] == '2'):
            self.speedgrade = -2
        
        XilinxPlatform.__init__(self, device, _io, connectors, toolchain="vivado")
        self.add_extension(pds_io)
        print(pds_pds)
        self.add_extension(pds_pds)
        
        self.toolchain.bitstream_commands = \
            ["set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR No [current_design]",
             "set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 2 [current_design]",
             "set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]",
             "set_property BITSTREAM.GENERAL.COMPRESS true [current_design]",
             "set_property BITSTREAM.GENERAL.CRC DISABLE [current_design]",
             "set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]",
             "set_property CONFIG_VOLTAGE 3.3 [current_design]",
             "set_property CFGBVS VCCO [current_design]"
#             , "set_property STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE AreaOptimized_high [get_runs synth_1]"
             ]

    def create_programmer(self):
        bscan_spi = "bscan_spi_xc7a35t.bit"
        return OpenOCD("openocd_xc7_ft2232.cfg", bscan_spi) #FIXME

    def do_finalize(self, fragment):
        XilinxPlatform.do_finalize(self, fragment)
        #self.add_period_constraint(self.lookup_request("clk48", loose=True), 1e9/48e6)
