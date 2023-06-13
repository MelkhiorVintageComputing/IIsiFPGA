from migen import *
from migen.genlib.fifo import *
from migen.genlib.cdc import *
from migen.fhdl.specials import Tristate

import litex
from litex.soc.interconnect import wishbone

class MC68030_SYNC_FSM(Module):
    def __init__(self, soc, wb_read, wb_write, cd_cpu="cpu"):

        platform = soc.platform
        
        # 68030
        A = platform.request("A_3v3") # 32 # address, I[O]
        D = platform.request("D_3v3") # 32 # data, IO
        RW_n = platform.request("rw_3v3_n") #  direction of bus transfer with respect to the main processor, I [three-state, high read, write low]
        DS_n = platform.request("ds_3v3_n") # data strobe, I[O]
        BERR_n = platform.request("berr_3v3_n") # bus error, [I]O
        #HALT_n = platform.request("halt_3v3_n") # Signal indicating that main processor should suspend all bus activity, O
        SIZ_n = platform.request("siz_3v3") # 2 # in conjunction with processor’s dynamic bus sizing capabilities to indicate number of bytes remaining to be transferred during current bus cycle, I [three-state]

        FC = platform.request("fc_3v3") # 3 # Function code used to identify address space of current bus cycle, I[O]
        # RESET_n = platform.request("RESET_n") # Bidirectional signal that initiates system reset
        # RMC = platform.request("RMC") #  identifies current bus cycle as part of indivisible read-modify-write operation, three-state
        DSACK_n = platform.request("dsack_3v3_n") # 2 # Data transfer acknowledge, I[O]
        CBREQ_n = platform.request("cbreq_3v3_n") # CPU burst reuqest, I ?
        CBACK_n = platform.request("cback_3v3_n") # CPU burst ack, w/ STERM, IO ?
        STERM_n = platform.request("sterm_3v3_n") # indicates termination of a transfer using the MC68030 synchronous cycle, [I]O
        # in this version STERM is negated by the driver

        AS_n = platform.request("as_3v3_n") # address strobe, I [three-state]
        CIOUT_n = platform.request("ciout_3v3_n") # cache inhibit out (from cpu), I

        # BR_n = platform.request("BR_n") # bus request, I
        # CPU_BG_n = platform.request("CPU_BG_n") # processor bus grant, I ?
        # BGACK_n = platform.request("BGACK_n") # bus grant ack, I
        
        # IPL = platform.request("IPL") # 3 # Interrupt priority-level lines.
        ## DBEN_n not in PDS slot (buffer enable)
        ## CIIN_n not in PDS slot (cache in inhibit)
        ## OCS_n not in PDS slot (operand cycle start)
        ## ECS_n not in PDS slot (external cycle start) # is on IIfx

         # not 68030
        CACHE = platform.request("cache_3v3")
        # CLK16M not connected
        # CPU_CLK = platform.request("CPU_CLK") # handled in CRG
        # CPU_DISABLE_n = platform.request("CPU_DISABLE_n") # Disables the MC68030 CPU (and MC68882 FPU, if installed) on the main logic board. This signal is used by a PDS card that replaces the main processor.
        # CPU_TYPE = platform.request("CPU_TYPE") # Defines bus protocol for the PDS; logical one (1) for MC68020 and MC68030, logical zero (0) for MC68040. # not in IIci
        # FC3 not connected # Additional function code bit, used to indicate that the software is running in 32-bit address mode. (As in the Macintosh LC II, the software always runs in 32-bit mode.) # not in IIci
        # FPU_SEL_n = platform.request("FPU_SEL_n") # Select signal for an optional MC68881 or MC68882 FPU on the card. # not in IIci
        # PDS_AS not connected (16 MHz AS)
        # PDS_DSACK not connected (16 MHz DSACK)
        # 16MASTER not connected (grounded on board for 32 bits)
        # SLOT_BG_n = platform.request("SLOT_BG_n") # Bus grant signal to the expansion card. # not in IIci
        #SLOTIRQ_E_n = platform.request("SLOTIRQ_n") # IRQ for (pseudo-)slot E # not in IIci
        # SLOTIRQ_C_n # not supported on LCIII/LC520 # IRQ for (pseudo-)slot C # not in IIci
        # SLOTIRQ_D_n # not supported on LCIII/LC520 # IRQ for (pseudo-)slot D # not in IIci
        # SNDOUT not connected (Apple II-style sound) # not in IIci
	# # ROMOE_n only in IIci
	# # BUSLOCK_n only in SE/30, IIsi (nubus bus lock)
	# # NUBUS_n only in SE/30, IIsi (signal nubus access)
	# # BCLK only in SE/30, IIsi (VIA clock)
	# # PFW only in SE/30, IIsi (power failure)
	
        #card_select = Signal()
        # we don't have 24-bits mode, FC3 is assumed to be 1
        #self.comb += card_select.eq(A[31] & (~FC[0] | ~FC[1] | ~FC[2])) # high-order address bit set & not in CPU spac

        A_i = Signal(32)
        #A_o = Signal(32)
        #A_oe = Signal(reset = 0)
        #self.specials += Tristate(A, A_o, A_oe, A_i)
        A_latch = Signal(32)
        self.comb += [ A_i.eq(A) ]
        #A_i_le = Signal(32)
        #A_latch_le = Signal(32)
        #self.comb += [ A_i_le.eq(Cat(A[24:32], A[16:24], A[8:16], A[0:8])) ]
        #self.comb += [ A_latch_le.eq(Cat(A_latch[24:32], A_latch[16:24], A_latch[8:16], A_latch[0:8])) ]
        
        D_i = Signal(32)
        D_o = Signal(32)
        D_oe = Signal(reset = 0)
        self.specials += Tristate(D, D_o, D_oe, D_i)
        D_latch = Signal(32)
        
        #DSACK_i_n = Signal(2)
        #DSACK_o_n = Signal(2)
        #DSACK_oe = Signal(reset = 0)
        #self.specials += Tristate(DSACK_n, DSACK_o_n, DSACK_oe, DSACK_i_n)
        
        CBREQ_i_n = Signal(1)
        #CBREQ_o_n = Signal(1, reset = 1)
        #CBREQ_oe = Signal(reset = 0)
        #self.specials += Tristate(CBREQ_n, CBREQ_o_n, CBREQ_oe, CBREQ_i_n)
        self.comb += [ CBREQ_i_n.eq(CBREQ_n) ]
        
        #CBACK_i_n = Signal(1)
        CBACK_o_n = Signal(1, reset = 1)
        #CBACK_oe = Signal(reset = 0)
        #self.specials += Tristate(CBACK_n, CBACK_o_n, CBACK_oe, CBACK_i_n)
        self.comb += [ CBACK_n.eq(CBACK_o_n) ]
        
        #STERM_i_n = Signal(1)
        STERM_o_n = Signal(1, reset = 1)
        #STERM_oe = Signal(reset = 0)
        #self.specials += Tristate(STERM_n, STERM_o_n, STERM_oe, STERM_i_n)
        self.comb += [ STERM_n.eq(STERM_o_n) ]
        
        SIZ_i_n = Signal(2)
        #SIZ_o_n = Signal(2)
        #SIZ_oe = Signal(reset = 0)
        #self.specials += Tristate(SIZ_n, SIZ_o_n, SIZ_oe, SIZ_i_n)
        self.comb += [ SIZ_i_n.eq(SIZ_n) ]
        
        AS_i_n = Signal()
        #AS_o_n = Signal()
        #AS_oe = Signal(reset = 0)
        #self.specials += Tristate(CPU_AS_n, AS_o_n, AS_oe, AS_i_n)
        self.comb += [ AS_i_n.eq(AS_n) ]
        
        CIOUT_i_n = Signal(1)
        #CIOUT_o_n = Signal(1, reset = 1)
        #CIOUT_oe = Signal(reset = 0)
        #self.specials += Tristate(CIOUT_n, CIOUT_o_n, CIOUT_oe, CIOUT_i_n)
        self.comb += [ CIOUT_i_n.eq(CIOUT_n) ]
        
        DS_i_n = Signal()
        #DS_o_n = Signal()
        #DS_oe = Signal(reset = 0)
        #self.specials += Tristate(DS_n, DS_o_n, DS_oe, DS_i_n)
        self.comb += [ DS_i_n.eq(DS_n) ]
        
        #CACHE_i = Signal(1)
        CACHE_o = Signal(1, reset = 0)
        #CACHE_oe = Signal(reset = 0)
        #self.specials += Tristate(CACHE, CACHE_o, CACHE_oe, CACHE_i)
        self.comb += [ CACHE.eq(CACHE_o) ]

        my_space = Signal()
        self.comb += [ my_space.eq((A_i[24:32] == 0xf9) & (~FC[0] | ~FC[1] | ~FC[2])) ] # checkme
        #self.comb += [ my_space.eq((~FC[0] | ~FC[1] | ~FC[2])) ] # checkme
        
        self.submodules.slave_fsm = slave_fsm = ClockDomainsRenamer(cd_cpu)(FSM(reset_state="Reset"))
        slave_fsm.act("Reset",
                      NextState("Idle")
        )
        slave_fsm.act("Idle",
                      If((my_space & ~AS_i_n & RW_n), # Read
                         wb_read.cyc.eq(1),
                         wb_read.stb.eq(1),
                         wb_read.we.eq(0),
                         wb_read.sel.eq(0xf), # always read 32-bits for cache
                         wb_read.adr.eq(Cat(A_i[2:24], Signal(8, reset = 0x00))),
                         NextValue(A_latch, A_i),
                         STERM_o_n.eq(1), # insert delay
                         NextState("Read"),
                      ).Elif((my_space & ~AS_i_n & ~RW_n), # Write, data not ready just yet
                             NextValue(A_latch, A_i),
                             STERM_o_n.eq(1), # insert delay
                             NextState("Write"),
                      )
        )
        slave_fsm.act("Read",
                      wb_read.cyc.eq(1),
                      wb_read.stb.eq(1),
                      wb_read.we.eq(0),
                      wb_read.sel.eq(0xf),
                      wb_read.adr.eq(Cat(A_latch[2:24], Signal(8, reset = 0x00))),
                      STERM_o_n.eq(1), # insert delay
                      If(wb_read.ack,
                         NextValue(D_latch, wb_read.dat_r),
                         D_oe.eq(1),
                         D_o.eq(wb_read.dat_r),
                         STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                         NextState("FinishRead"),
                      )
        )
        slave_fsm.act("FinishRead",
                      D_oe.eq(1), # keep data one more cycle
                      D_o.eq(D_latch),
                      STERM_o_n.eq(0), # ACK finished after 1 cycle
                      NextState("Idle"),
        )
        slave_fsm.act("Write",
                      wb_write.cyc.eq(1),
                      wb_write.stb.eq(1),
                      wb_write.we.eq(1),
                      # assumes SIZ & A_i[0:2] are both 0 (longword, aligned), checkme
                      wb_write.sel.eq(0xF),
                      wb_write.adr.eq(Cat(A_latch[2:24], Signal(8, reset = 0x00))),
                      wb_write.dat_w.eq(D_i), # data available this cycle (and later)
                      STERM_o_n.eq(1), # wait
                      If(wb_write.ack,
                         STERM_o_n.eq(0),
                         NextState("FinishWrite"),
                      )
        )
        slave_fsm.act("FinishWrite", # unnecessary ?
                      STERM_o_n.eq(1), # finish ACK after one cycle
                      NextState("Idle"),
        )
