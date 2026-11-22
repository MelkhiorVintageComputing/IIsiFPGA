#
# Copyright (c) 2024 Romain Dolbeau <romain@dolbeau.org>
# SPDX-License-Identifier: BSD-2-Clause

from litex.build.generic_platform import *
from litex.build.xilinx import XilinxPlatform
from litex.build.openocd import OpenOCD

from VintageBusFPGA_Common.trenz_0710_common import TE0710Platform

# IOs ----------------------------------------------------------------------------------------------

# IisiFPGA I/O
# I/O
_pds_io_v2_0 = [
    # HDMI
    # all backwards
    ("hdmi", 0,
        Subsignal("clk_n",   Pins("T8"), IOStandard("TMDS_33")),
        Subsignal("clk_p",   Pins("R8"), IOStandard("TMDS_33")),
        Subsignal("data0_n", Pins("U6"), IOStandard("TMDS_33")),
        Subsignal("data0_p", Pins("U7"), IOStandard("TMDS_33")),
        Subsignal("data1_n", Pins("P3"), IOStandard("TMDS_33")),
        Subsignal("data1_p", Pins("P4"), IOStandard("TMDS_33")),
        Subsignal("data2_n", Pins("M2"), IOStandard("TMDS_33")),
        Subsignal("data2_p", Pins("M3"), IOStandard("TMDS_33")),
        #Subsignal("hpd",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("sda",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("scl",     Pins(""), IOStandard("LVCMOS33")),
        #Subsignal("cec",     Pins(""), IOStandard("LVCMOS33")),
    ),
    ("user_led", 0, Pins("V9"),  IOStandard("lvcmos33")), # LED0
    ("clk54", 0, Pins("R3"), IOStandard("LVCMOS33")),
    ]

# PDS
_pds_pds_v2_0 = [
    # main stuff (also in IIsiFPGA V1.0)
    ("A_3v3",              0, Pins("C11 C10 A10  A9  C9  B9 F13 F14 "
                                   "H14 G14 B18 A18 B17 B16 J14 H15 "
                                   "A16 A15 G16 H16 F16 F15 A14 A13 "
                                   "C15 D15 A11 B11  B8 R13 R12 L18 "), IOStandard("lvttl")),
    ("D_3v3",              0, Pins(" N2  N1  L6  L5  R1  T1  N4  M4 "
                                   "J18 J17 G18 F18 C12 B12 K13 J13 "
                                   "J15 E16 E15 H17 G17 E17 D17 C17 "
                                   "D14 C14 B14 B13 D13 D12 T11 M18 "), IOStandard("lvttl")),
    ("cpuclk_3v3_n",       0, Pins("T5"), IOStandard("lvttl")),
    ("reset_3v3_n",        0, Pins("L1"), IOStandard("lvttl")),
    ("berr_3v3_n",         0, Pins("K6"), IOStandard("lvttl")),
    ("cback_3v3_n",        0, Pins("V4"), IOStandard("lvttl")),
    ("cbreq_3v3_n",        0, Pins("R7"), IOStandard("lvttl")),
    ("ciout_3v3_n",        0, Pins("T3"), IOStandard("lvttl")),
    ("cache_3v3",          0, Pins("M6"), IOStandard("lvttl")),
    ("fc_3v3",             0, Pins("M1 R5 R6"), IOStandard("lvttl")),
    ("siz_3v3",            0, Pins("U1 V1"), IOStandard("lvttl")),
    ("rw_3v3_n",           0, Pins("U3"), IOStandard("lvttl")),
    ("dsack_3v3_n",        0, Pins("U4 T6"), IOStandard("lvttl")),
    ("ds_3v3_n",           0, Pins("P5"), IOStandard("lvttl")),
    ("halt_3v3_n",         0, Pins("D18"), IOStandard("lvttl")),
    ("as_3v3_n",           0, Pins("V2"), IOStandard("lvttl")),
    ("sterm_3v3_n",        0, Pins("V5"), IOStandard("lvttl")),
    ("irq1_3v3_n",         0, Pins("T4"), IOStandard("lvttl")),

    # master stuff (connected via switch on IIsiFPGA V1.0)
    # ("fpu_3v3_n",          0, Pins(""), IOStandard("lvttl")),
    ("bg_3v3_n",           0, Pins("R2"), IOStandard("lvttl")),
    ("br_3v3_n",           0, Pins("P2"), IOStandard("lvttl")),
    ("bgack_3v3_n",        0, Pins("U2"), IOStandard("lvttl")),
    ("c16m_3v3_n",         0, Pins("N5"), IOStandard("lvttl")),
    ("irq2_3v3_n",         0, Pins("V6"), IOStandard("lvttl")),
    ("irq3_3v3_n",         0, Pins("V7"), IOStandard("lvttl")),
    # ("rbv_3v3_n",          0, Pins(""), IOStandard("lvttl")),

    # extra signal for /halt explicit tri-stating, not on V1.0
    ("halt_3v3_oe",         0, Pins("E18"), IOStandard("lvttl")),

    # external SRAM control, not on V1.0
    ("sram_b0_we_n",       0, Pins("K5"), IOStandard("lvttl")), # CHECKME: IOStandard for SRAM
    ("sram_b1_we_n",       0, Pins("K15"), IOStandard("lvttl")),
    ("sram_b2_we_n",       0, Pins("C16"), IOStandard("lvttl")),
    ("sram_b3_we_n",       0, Pins("R10"), IOStandard("lvttl")),
    ("sram_oe_n",          0, Pins("L4"), IOStandard("lvttl")),
    ("cache_ce_n",         0, Pins("U8"), IOStandard("lvttl")),
    ("sram_a2",            0, Pins("K3"), IOStandard("lvttl")),
    ("sram_a2",            0, Pins("L3"), IOStandard("lvttl")),
]

# Connectors ---------------------------------------------------------------------------------------
connectors_v2_0 = [
    ("P1", ""), # check sequence! currently in pmod-* order
    ]

# Platform -----------------------------------------------------------------------------------------

class Platform(TE0710Platform):

    def __init__(self, variant="TE0710-03-42C21", version="V2.0"):
        
        pds_io = {
            "V2.0" : _pds_io_v2_0,
        }[version]
        pds_pds = {
            "V2.0" : _pds_pds_v2_0,
        }[version]
        connectors = {
            "V2.0" : connectors_v2_0,
        }[version]
        
        TE0710Platform.__init__(self, variant=variant, version=version, connectors=connectors)
        self.add_extension(pds_io)
        #print(pds_pds)
        self.add_extension(pds_pds)
