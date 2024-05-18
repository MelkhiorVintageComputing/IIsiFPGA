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

from VintageBusFPGA_Common.ztex_21x_common import ZTexPlatform

# IOs ----------------------------------------------------------------------------------------------

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
    ]

# PDS
_pds_pds_v1_0 = [
    ("A_3v3",              0, Pins("V9  U9  V7  U8  V6  U7  V5  U6  "
                                   "V4  J18 K16 J17 K15 K13 J15 J13 "
                                   "H15 H14 J14 G14 H17 G16 G17 G18 "
                                   "F16 F18 E18 F15 D18 E17 G13 D17 "), IOStandard("lvttl")),
    ("D_3v3",              0, Pins("R1  A13 M4  B12 C12 T1  B14 B13 "
                                   "N4  A16 A15 P3  D13 D12 L5  C14 "
                                   "D14 P4  B17 B16 L6  C15 D15 A18 "
                                   "B18 C17 C16 E16 E15 F13 F14 K6  "), IOStandard("lvttl"), Misc("SLEW=FAST")),
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
    ("sterm_3v3_n",        0, Pins("M1"), IOStandard("lvttl"), Misc("SLEW=FAST"), Drive(16)),
    ("irq1_3v3_n",           0, Pins("L1"), IOStandard("lvttl")),
]

_pds_pdsled_v1_0 = [
    ("user_led", 1, Pins("N6"),  IOStandard("lvcmos33")), # pretend LED0, pmod #11
    ("user_led", 0, Pins("M6"),  IOStandard("lvcmos33")), # pretend LED1, pmod #12
    ("user_led", 3, Pins("N5"),  IOStandard("lvcmos33")), # pretend LED0, pmod #9
    ("user_led", 2, Pins("P5"),  IOStandard("lvcmos33")), # pretend LED1, pmod #10
    ("user_led", 5, Pins("R3"),  IOStandard("lvcmos33")), # pretend LED0, pmod #7
    ("user_led", 4, Pins("T3"),  IOStandard("lvcmos33")), # pretend LED1, pmod #8
    ("user_led", 7, Pins("U1"),  IOStandard("lvcmos33")), # pretend LED0, pmod #5
    ("user_led", 6, Pins("V1"),  IOStandard("lvcmos33")), # pretend LED1, pmod #6
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

class Platform(ZTexPlatform):

    def __init__(self, variant="ztex2.13a", version="V1.0"):
        
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
        
        ZTexPlatform.__init__(self, variant=variant, version=version, connectors=connectors)
        self.add_extension(pds_io)
        #print(pds_pds)
        self.add_extension(pds_pds)
