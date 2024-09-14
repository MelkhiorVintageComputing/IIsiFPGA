from migen import *
from migen.genlib.fifo import *
from migen.genlib.cdc import *
from migen.fhdl.specials import Tristate

import litex
from litex.soc.interconnect import wishbone

class MC68030_SYNC_FSM(Module):
    def __init__(self, soc, wb_read, wb_write, dram_native_r, cd_cpu="cpu", trace_inst_fifo = None, rd68891 = False, rd68883 = False, slot = 0x9):

        if (rd68891 and rd68883):
            print("Only one copro supported for now")
            assert(False)

        platform = soc.platform

        sync_cpu = getattr(self.sync, cd_cpu)
        
        # 68030
        A = platform.request("A_3v3") # 32 # address, I[O]
        D = platform.request("D_3v3") # 32 # data, IO
        RW_n = platform.request("rw_3v3_n") #  direction of bus transfer with respect to the main processor, I [three-state, high read, write low]
        DS_n = platform.request("ds_3v3_n") # data strobe, I[O]
        BERR_n = platform.request("berr_3v3_n") # bus error, [I]O
        #HALT_n = platform.request("halt_3v3_n") # Signal indicating that main processor should suspend all bus activity, O
        SIZ = platform.request("siz_3v3") # 2 # in conjunction with processor’s dynamic bus sizing capabilities to indicate number of bytes remaining to be transferred during current bus cycle, I [three-state]

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

        D_rev_i = Signal(32)
        D_rev_o = Signal(32)

        # ugly-as-F byte reversal, invert endianess to match NuBusFPGA ...
        self.comb += [
            D_rev_i[ 0: 8].eq(D_i[24:32]),
            D_rev_i[ 8:16].eq(D_i[16:24]),
            D_rev_i[16:24].eq(D_i[ 8:16]),
            D_rev_i[24:32].eq(D_i[ 0: 8]),
            
            D_o[ 0: 8].eq(D_rev_o[24:32]),
            D_o[ 8:16].eq(D_rev_o[16:24]),
            D_o[16:24].eq(D_rev_o[ 8:16]),
            D_o[24:32].eq(D_rev_o[ 0: 8]),
        ]
        
        RW_i_n = Signal(1)
        #RW_o_n = Signal(1, reset = 1)
        #RW_oe = Signal(reset = 0)
        #self.specials += Tristate(RW_n, RW_o_n, RW_oe, RW_i_n)
        self.comb += [ RW_i_n.eq(RW_n) ]
        
        DS_i_n = Signal()
        #DS_o_n = Signal()
        #DS_oe = Signal(reset = 0)
        #self.specials += Tristate(DS_n, DS_o_n, DS_oe, DS_i_n)
        self.comb += [ DS_i_n.eq(DS_n) ]

        # force tristate
        BERR_i_n = Signal(1)
        BERR_o_n = Signal(1, reset = 1)
        BERR_oe = Signal(reset = 0)
        self.specials += Tristate(BERR_n, BERR_o_n, BERR_oe, BERR_i_n)
        
        # force tristate
        DSACK_i_n = Signal(2)
        DSACK_o_n = Signal(2)
        DSACK_oe = Signal(reset = 0)
        self.specials += Tristate(DSACK_n, DSACK_o_n, DSACK_oe, DSACK_i_n)
        
        CBREQ_i_n = Signal(1)
        #CBREQ_o_n = Signal(1, reset = 1)
        #CBREQ_oe = Signal(reset = 0)
        #self.specials += Tristate(CBREQ_n, CBREQ_o_n, CBREQ_oe, CBREQ_i_n)
        self.comb += [ CBREQ_i_n.eq(CBREQ_n) ]

        # force tristate
        CBACK_i_n = Signal(1)
        CBACK_o_n = Signal(1, reset = 1)
        CBACK_oe = Signal(reset = 0)
        self.specials += Tristate(CBACK_n, CBACK_o_n, CBACK_oe, CBACK_i_n)
        #self.comb += [ CBACK_n.eq(CBACK_o_n) ]
        
        STERM_i_n = Signal(1)
        STERM_o_n = Signal(1, reset = 1)
        STERM_oe = Signal(reset = 0)
        self.specials += Tristate(STERM_n, STERM_o_n, STERM_oe, STERM_i_n)
        
        SIZ_i = Signal(2)
        #SIZ_o = Signal(2)
        #SIZ_oe = Signal(reset = 0)
        #self.specials += Tristate(SIZ, SIZ_o, SIZ_oe, SIZ_i)
        self.comb += [ SIZ_i.eq(SIZ) ]
        
        FC_i = Signal(3)
        #FC_o = Signal(3)
        #FC_oe = Signal(reset = 0)
        #self.specials += Tristate(FC, FC_o, FC_oe, FC_i)
        self.comb += [ FC_i.eq(FC) ]
        
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
        
        #CACHE_i = Signal(1)
        CACHE_o = Signal(1, reset = 0)
        #CACHE_oe = Signal(reset = 0)
        #self.specials += Tristate(CACHE, CACHE_o, CACHE_oe, CACHE_i)
        self.comb += [ CACHE.eq(CACHE_o) ]

        # 23 first bits not rewritten (8 MiB)
        # address rewriting (slot)
        slot_processed_ad = Signal(32)
        self.comb += [
            If(~A_i[23], # first 8 MiB of slot space: remap to last 8 Mib of SDRAM
               slot_processed_ad[23:32].eq(Cat(Signal(1, reset=1), Signal(8, reset = 0x8f))), # 0x8f8...
            ).Else( # second 8 MiB: direct access
                slot_processed_ad[23:32].eq((Cat(Signal(1, reset=1), Signal(8, reset = 0xf0)))), # 24 bits, a.k.a 22 bits of words
            )
        ]

        # address rewriting (mem)
        mem_processed_ad = Signal(32)
        self.comb += [
            #mem_processed_ad[23:27].eq(A_i[23:27]),
            #mem_processed_ad[27:32].eq(Signal(5, reset=0x10)), # 0x80 >> 3 == 0x10
            mem_processed_ad[23:28].eq(A_i[23:28]),
            mem_processed_ad[28:32].eq(Signal(4, reset=0x8)), # 0x80 >> 4 == 0x8
            ##mem_processed_ad[23:26].eq(A_i[23:26]),
            ##mem_processed_ad[26:32].eq(Signal(6, reset=0x20)), # 0x80 >> 2 == 0x20
        ]

        # address rewriting (superslot)
        superslot_processed_ad = Signal(32)
        self.comb += [
            superslot_processed_ad[23:28].eq(A_i[23:28]),
            superslot_processed_ad[28:32].eq(Signal(4, reset=0x8)), # 0x80 >> 4 == 0x8
        ]

        # CPU cycle space (FC = 0x7)
        cpu_mgt_cycle = Signal()
        self.comb += [
            cpu_mgt_cycle.eq(FC_i[0] & FC_i[1] & FC_i[2]),
        ]

        # selection logic
        my_slot_space = Signal()
        self.comb += [ my_slot_space.eq((A_i[24:32] == (0xf0 + slot))) ]
        
        my_mem_space = Signal()
        #self.comb += [ my_mem_space.eq((A_i[27:32] == 0x01)) ] # 0x08 >> 3 == 0x01
        ####self.comb += [ my_mem_space.eq((A_i[27:32] == 0x04) & (~FC_i[0] | ~FC_i[1] | ~FC_i[2])) ] # 0x20 >> 3 == 0x04
        self.comb += [ my_mem_space.eq((A_i[28:32] == 0x2)) ] # 0x20 >> 4 == 0x2
        ###self.comb += [ my_mem_space.eq((A_i[26:32] == 0x1) & (~FC_i[0] | ~FC_i[1] | ~FC_i[2])) ] # 0x04 >> 2 == 0x1
        
        my_superslot_space = Signal()
        self.comb += [ my_superslot_space.eq((A_i[28:32] == slot)) ]
        
        my_device_space = Signal()
        
        # force the MDU not to anwser when we deal with it
        self.comb += [ CACHE_o.eq(0), ]
        #self.comb += [ CACHE_o.eq(my_mem_space & ~cpu_mgt_cycle), ]
        #platform.add_platform_command("set_max_delay -from [get_ports A_3v3] -to [get_ports cache_3v3] 10")
        #platform.add_platform_command("set_max_delay -from [get_ports fc_3v3] -to [get_ports cache_3v3] 10")
        ##self.comb += [ CACHE_o.eq(my_mem_space), ]
        ##platform.add_platform_command("set_max_delay -from [get_ports A_3v3] -to [get_ports cache_3v3] 10")
        ###self.comb += [ CACHE_o.eq(~((A_i[26:32] == 0x0) & (~FC_i[0] | ~FC_i[1] | ~FC_i[2]))), ] # disable for bank A, enable for everything else
        ####self.comb += [ CACHE_o.eq(A_i[29:32] != 0x0), ]
        ####platform.add_platform_command("set_max_delay -from [get_ports A_3v3] -to [get_ports cache_3v3] 10")

        # more selection logic
        processed_ad = Signal(32)
        self.comb += [
            processed_ad[ 0:23].eq(A_i[ 0:23]),
            If(my_slot_space,
               processed_ad[23:32].eq(slot_processed_ad[23:32]),
            ).Elif(my_mem_space,
                   processed_ad[23:32].eq(mem_processed_ad[23:32]),
            ).Elif(my_superslot_space,
                   processed_ad[23:32].eq(superslot_processed_ad[23:32]),
            ).Else(
                processed_ad[23:32].eq(A_i[23:32]),
            ),
            my_device_space.eq(my_slot_space | my_mem_space | my_superslot_space),
        ]

        # write FIFO to speed up bus turnaround on CPU side
        write_fifo_layout = [
            ("adr", 32),
            ("data", 32),
            ("sel", 4),
        ]
        self.submodules.write_fifo = write_fifo = ClockDomainsRenamer({"read": "sys", "write": "cpu"})(AsyncFIFOBuffered(width=layout_len(write_fifo_layout), depth=16))
        write_fifo_dout = Record(write_fifo_layout)
        self.comb += write_fifo_dout.raw_bits().eq(write_fifo.dout)
        write_fifo_din = Record(write_fifo_layout)
        self.comb += write_fifo.din.eq(write_fifo_din.raw_bits())
        # for storing SEL
        current_sel = Signal(4)

        # back-pressure from sys to cpu clock domain
        self.submodules.write_fifo_readable_sync = BusSynchronizer(width = 1, idomain = "sys", odomain = "cpu")
        write_fifo_readable_in_cpu = Signal()
        self.comb += self.write_fifo_readable_sync.i.eq(self.write_fifo.readable)
        self.comb += write_fifo_readable_in_cpu.eq(self.write_fifo_readable_sync.o)

        self.submodules.slave_fsm = slave_fsm = ClockDomainsRenamer(cd_cpu)(FSM(reset_state="Reset"))
            
        #led = platform.request("user_led", 0)
        #self.comb += [ led.eq(~slave_fsm.ongoing("Idle")), ]

        #led = platform.request("user_led", 0)
        #my_mem_space_reg = Signal()
        #sync_cpu += [
        #    If(my_mem_space & ~AS_i_n,
        #       my_mem_space_reg.eq(1),
        #    ),
        #]
        #self.comb += [ led.eq(my_mem_space_reg), ]

        ### dram_native_r
        self.comb += [
            dram_native_r.cmd.we.eq(0), # never write
            dram_native_r.cmd.addr.eq(processed_ad[4:]), # assume 128 bits (16 bytes)
        ]
        ## dram_native_r.cmd.valid ->
        ## dram_native_r.cmd.ready <-
        ## dram_native_r.rdata.valid <-
        ## self.dram_native_r.rdata.data <-
        burst_counter = Signal(2)
        burst_buffer = Signal(128)
        
        #led = platform.request("user_led", 0)
        #saw_cbreq = Signal()
        #self.comb += [ led.eq(saw_cbreq), ]
        
        slave_fsm.act("Reset",
                      NextState("Idle")
        )
        slave_fsm.act("Idle",
                      #STERM_oe.eq(0),
                      #D_oe.eq(0),
                      If(my_mem_space & ~cpu_mgt_cycle & ~AS_i_n & ~CBREQ_i_n & RW_i_n, # Burst read to memory
                         STERM_oe.eq(1), # enable STERM
                         STERM_o_n.eq(1), # insert delay
                         CBACK_oe.eq(1),
                         CBACK_o_n.eq(1),
                         BERR_oe.eq(1),
                         BERR_o_n.eq(1),
                         NextValue(burst_counter, processed_ad[2:4]),
                         If(~write_fifo_readable_in_cpu, # previous write(s) done
                            dram_native_r.cmd.valid.eq(1),
                            If(dram_native_r.cmd.ready, # interface available
                               NextState("BurstReadWait"),
                            ),
                         ),
                         ##NextValue(saw_cbreq, 1), ###############################"
                      ).Elif((my_device_space & ~cpu_mgt_cycle & ~AS_i_n & RW_i_n), # Read
                         STERM_oe.eq(1), # enable STERM
                         STERM_o_n.eq(1), # insert delay
                         CBACK_oe.eq(1),
                         CBACK_o_n.eq(1),
                         BERR_oe.eq(1),
                         BERR_o_n.eq(1),
                         If(~write_fifo_readable_in_cpu, # previous write(s) done
                            wb_read.cyc.eq(1),
                            wb_read.stb.eq(1),
                            wb_read.we.eq(0),
                            wb_read.sel.eq(0xf), # always read 32-bits for cache
                            wb_read.adr.eq(processed_ad[2:32]),
                            NextValue(A_latch, processed_ad),
                            NextState("Read"),
                         ),
                      ).Elif((my_device_space & ~cpu_mgt_cycle & ~AS_i_n & ~RW_i_n), # Write, data not ready just yet
                             # we detect ~AS_i_n at the beginning of S2.
                             # theoretically, we could have asserted /STERM already...
                             # but there's just no time to do it properly
                             # unless not waiting for /AS
                             STERM_oe.eq(1), # enable STERM
                             STERM_o_n.eq(1),
                             CBACK_oe.eq(1),
                             CBACK_o_n.eq(1),
                             BERR_oe.eq(1),
                             BERR_o_n.eq(1),
                             NextValue(A_latch, processed_ad),
                             Case(SIZ_i, {
                                 0x0: [ # long word
                                     Case(processed_ad[0:2], {
                                         0x0: [
                                             NextValue(current_sel, 0xF),
                                         ],
                                         0x1: [
                                             NextValue(current_sel, 0xE),
                                         ],
                                         0x2: [
                                             NextValue(current_sel, 0xC),
                                         ],
                                         0x3: [
                                             NextValue(current_sel, 0x8),
                                         ],
                                     }),
                                 ],
                                 0x1: [ # byte
                                     Case(processed_ad[0:2], {
                                         0x0: [
                                             NextValue(current_sel, 0x1),
                                         ],
                                         0x1: [
                                             NextValue(current_sel, 0x2),
                                         ],
                                         0x2: [
                                             NextValue(current_sel, 0x4),
                                         ],
                                         0x3: [
                                             NextValue(current_sel, 0x8),
                                         ],
                                     }),
                                 ],
                                 0x2: [ # word
                                     Case(processed_ad[0:2], {
                                         0x0: [
                                             NextValue(current_sel, 0x3),
                                         ],
                                         0x1: [
                                             NextValue(current_sel, 0x6),
                                         ],
                                         0x2: [
                                             NextValue(current_sel, 0xC),
                                         ],
                                         0x3: [
                                             NextValue(current_sel, 0x8),
                                         ],
                                     }),
                                 ],
                                 0x3: [ # 3-bytes
                                     Case(processed_ad[0:2], {
                                         0x0: [
                                             NextValue(current_sel, 0x7),
                                         ],
                                         0x1: [
                                             NextValue(current_sel, 0xE),
                                         ],
                                         0x2: [
                                             NextValue(current_sel, 0xC),
                                         ],
                                         0x3: [
                                             NextValue(current_sel, 0x8),
                                         ],
                                     }),
                                 ],
                             }),
                             If(write_fifo.writable,
                                STERM_o_n.eq(0), # assert /STERM immediately (we already have a wait state)
                                NextState("FinishWrite"),
                             ),
                      )
        )
        slave_fsm.act("Read",
                      wb_read.cyc.eq(1),
                      wb_read.stb.eq(1),
                      wb_read.we.eq(0),
                      wb_read.sel.eq(0xf),
                      wb_read.adr.eq(A_latch[2:32]),
                      STERM_oe.eq(1), # enable STERM
                      STERM_o_n.eq(1), # insert delay
                      CBACK_oe.eq(1),
                      CBACK_o_n.eq(1),
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      If(wb_read.ack,
                         NextValue(D_latch, wb_read.dat_r),
                         D_oe.eq(1),
                         D_rev_o.eq(wb_read.dat_r),
                         STERM_oe.eq(1), # enable STERM
                         STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                         CBACK_oe.eq(1),
                         CBACK_o_n.eq(1),
                         NextState("FinishRead"),
                      )
        )
        slave_fsm.act("FinishRead",
                      D_oe.eq(1), # keep data one more cycle
                      D_rev_o.eq(D_latch),
                      STERM_oe.eq(1), # enable STERM
                      STERM_o_n.eq(1), # ACK finished after 1 cycle
                      CBACK_oe.eq(1),
                      CBACK_o_n.eq(1),
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      NextState("Idle"),
        )
        slave_fsm.act("FinishWrite", # unnecessary ?
                      STERM_oe.eq(1), # enable STERM
                      STERM_o_n.eq(1), # finish ACK after one cycle
                      CBACK_oe.eq(1),
                      CBACK_o_n.eq(1),
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      write_fifo.we.eq(1), # we only strobe the FIFO here, all other connections are comb
                      NextState("Idle"),
        )
        slave_fsm.act("BurstReadWait",
                      STERM_oe.eq(1), # enable STERM
                      STERM_o_n.eq(1), # finish ACK after one cycle
                      CBACK_oe.eq(1),
                      CBACK_o_n.eq(1),
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      D_oe.eq(1),
                      dram_native_r.rdata.ready.eq(1),
                      D_rev_o.eq(0), # too early for the CPU to get
                      NextValue(burst_buffer, dram_native_r.rdata.data),
                      If(dram_native_r.rdata.valid,
                         STERM_oe.eq(1), # enable STERM for B0
                         STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                         CBACK_oe.eq(1), # burst
                         CBACK_o_n.eq(0), # burst cycle 0
                         #NextValue(burst_counter, burst_counter + 1),
                         NextState("Burst0"),
                      ),
        )
        slave_fsm.act("Burst0",
                      STERM_oe.eq(1), # enable STERM for B1
                      STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                      CBACK_oe.eq(1), # burst
                      CBACK_o_n.eq(0), # burst cycle 1
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      D_oe.eq(1),
                      NextValue(burst_counter, burst_counter + 1),
                      Case(burst_counter, {
                          0x0: [D_rev_o.eq(burst_buffer[ 0: 32]), ],
                          0x1: [D_rev_o.eq(burst_buffer[32: 64]), ],
                          0x2: [D_rev_o.eq(burst_buffer[64: 96]), ],
                          0x3: [D_rev_o.eq(burst_buffer[96:128]), ],
                      }),
                      NextState("Burst1"),
        )
        slave_fsm.act("Burst1",
                      STERM_oe.eq(1), # enable STERM for B2
                      STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                      CBACK_oe.eq(1), # burst
                      CBACK_o_n.eq(0), # burst cycle 2
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      D_oe.eq(1),
                      NextValue(burst_counter, burst_counter + 1),
                      Case(burst_counter, {
                          0x0: [D_rev_o.eq(burst_buffer[ 0: 32]), ],
                          0x1: [D_rev_o.eq(burst_buffer[32: 64]), ],
                          0x2: [D_rev_o.eq(burst_buffer[64: 96]), ],
                          0x3: [D_rev_o.eq(burst_buffer[96:128]), ],
                      }),
                      NextState("Burst2"),
        )
        slave_fsm.act("Burst2",
                      STERM_oe.eq(1), # enable STERM for B3
                      STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                      CBACK_oe.eq(1), # burst
                      CBACK_o_n.eq(1), # not on burst cycle 3
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      D_oe.eq(1),
                      NextValue(burst_counter, burst_counter + 1),
                      Case(burst_counter, {
                          0x0: [D_rev_o.eq(burst_buffer[ 0: 32]), ],
                          0x1: [D_rev_o.eq(burst_buffer[32: 64]), ],
                          0x2: [D_rev_o.eq(burst_buffer[64: 96]), ],
                          0x3: [D_rev_o.eq(burst_buffer[96:128]), ],
                      }),
                      NextState("Burst3"),
        )
        slave_fsm.act("Burst3",
                      STERM_oe.eq(1), # enable STERM
                      STERM_o_n.eq(1), # done
                      CBACK_oe.eq(1), # burst
                      CBACK_o_n.eq(1), # done
                      BERR_oe.eq(1),
                      BERR_o_n.eq(1),
                      D_oe.eq(1),
                      #NextValue(burst_counter, burst_counter + 1),
                      Case(burst_counter, {
                          0x0: [D_rev_o.eq(burst_buffer[ 0: 32]), ],
                          0x1: [D_rev_o.eq(burst_buffer[32: 64]), ],
                          0x2: [D_rev_o.eq(burst_buffer[64: 96]), ],
                          0x3: [D_rev_o.eq(burst_buffer[96:128]), ],
                      }),
                      #NextState("FinishBurstRead"),
                      NextState("Idle"),
                      ##NextValue(saw_cbreq, 0), ###############################"
        )
        #slave_fsm.act("FinishBurstRead",
        #              D_oe.eq(1), # keep data one more cycle
        #              #Case(burst_counter, {
        #              #    0x0: [D_rev_o.eq(burst_buffer[ 0: 32]), ],
        #              #    0x1: [D_rev_o.eq(burst_buffer[32: 64]), ],
        #              #    0x2: [D_rev_o.eq(burst_buffer[64: 96]), ],
        #              #    0x3: [D_rev_o.eq(burst_buffer[96:128]), ],
        #              #}),
        #              D_rev_o.eq(Cat(burst_counter, Signal(14, reset = 0), Signal(16, reset = 0xFF04))),
        #              STERM_oe.eq(1), # enable STERM
        #              STERM_o_n.eq(1), # ACK finished after 1 cycle
        #              CBACK_oe.eq(1),
        #              CBACK_o_n.eq(1),
        #              BERR_oe.eq(1),
        #              BERR_o_n.eq(1),
        #              NextState("Idle"),
        #              NextValue(saw_cbreq, 0), ###############################"
        #)
                      
        
        # connect the write FIFO inputs
        self.comb += [ write_fifo_din.adr.eq(A_latch), # recorded
                       write_fifo_din.data.eq(D_rev_i), # live
                       write_fifo_din.sel.eq(current_sel), # recorded
        ]
        # deal with emptying the Write FIFO to the write WB
        self.comb += [ wb_write.cyc.eq(write_fifo.readable),
                       wb_write.stb.eq(write_fifo.readable),
                       wb_write.we.eq(1),
                       wb_write.adr.eq(write_fifo_dout.adr[2:32]),
                       wb_write.dat_w.eq(write_fifo_dout.data),
                       wb_write.sel.eq(write_fifo_dout.sel),
                       write_fifo.re.eq(wb_write.ack),
        ]
        
        #

        copro = (rd68891 or rd68883)

        if (copro):
            self.submodules.copro_fsm = copro_fsm = ClockDomainsRenamer(cd_cpu)(FSM(reset_state="Reset"))
            
            if (rd68891):
                from rd68891 import rd68891
                self.submodules.copro = rd68891(cd_krypto = cd_cpu)
                copro_id_val = 0x6 # coprocessor id 0x110
            elif(rd68883):
                from rd68883 import rd68883
                self.submodules.copro = rd68883(platform = platform, cd_fpu = cd_cpu)
                copro_id_val = 0x7 # coprocessor id 0x111 (full 'working' version would be 0x001)
                
            regs = self.copro.regs
            reg_re = self.copro.reg_re
            reg_we = self.copro.reg_we
            
            do_long = Signal()
            
            my_copro_space = Signal()
            self.comb += [
                my_copro_space.eq((A_i[16:20] == 0x02) & # coprocessor space
                                  (A_i[13:16] == copro_id_val) # coprocessor id
                ),
            ]
            
            copro_fsm.act("Reset",
                          NextState("Idle")
            )
            copro_fsm.act("Idle",
                          If((my_copro_space & cpu_mgt_cycle & ~AS_i_n & RW_i_n), # Read
                             STERM_oe.eq(1), # enable STERM
                             STERM_o_n.eq(1), # insert delay
                             CBACK_oe.eq(1),
                             CBACK_o_n.eq(1),
                             BERR_oe.eq(1),
                             BERR_o_n.eq(1),
                             NextValue(A_latch, processed_ad),
                             NextState("Read"),
                             NextValue(do_long, ~SIZ[1]), # only word or long
                          ).Elif((my_copro_space & cpu_mgt_cycle & ~AS_i_n & ~RW_i_n), # Write, data not ready just yet
                                 # we detect ~AS_i_n at the beginning of S2.
                                 # theoretically, we could have asserted /STERM already...
                                 # but there's just no time to do it properly
                                 # unless not waiting for /AS
                                 STERM_oe.eq(1), # enable STERM
                                 STERM_o_n.eq(0), # assert /STERM immediately (we already have a wait state)
                                 CBACK_oe.eq(1),
                                 CBACK_o_n.eq(1),
                                 BERR_oe.eq(1),
                                 BERR_o_n.eq(1),
                                 NextValue(A_latch, processed_ad),
                                 Case(SIZ_i, { # IMPROVEME: duplicate code, CHECKME: endianess
                                     0x0: [ # long word
                                         Case(processed_ad[0:2], {
                                             0x0: [
                                                 NextValue(current_sel, 0xF),
                                             ],
                                             0x1: [
                                                 NextValue(current_sel, 0x7),
                                             ],
                                             0x2: [
                                                 NextValue(current_sel, 0x3),
                                             ],
                                             0x3: [
                                                 NextValue(current_sel, 0x1),
                                             ],
                                         }),
                                     ],
                                     0x1: [ # byte # shouldn't happen
                                         Case(processed_ad[0:2], {
                                             0x0: [
                                                 NextValue(current_sel, 0x8),
                                             ],
                                             0x1: [
                                                 NextValue(current_sel, 0x4),
                                             ],
                                             0x2: [
                                                 NextValue(current_sel, 0x2),
                                             ],
                                             0x3: [
                                                 NextValue(current_sel, 0x1),
                                             ],
                                         }),
                                     ],
                                     0x2: [ # word
                                         Case(processed_ad[0:2], {
                                             0x0: [
                                                 NextValue(current_sel, 0xC),
                                             ],
                                             0x1: [
                                                 NextValue(current_sel, 0x6),
                                             ],
                                             0x2: [
                                                 NextValue(current_sel, 0x3),
                                             ],
                                             0x3: [
                                                 NextValue(current_sel, 0x1),
                                             ],
                                         }),
                                     ],
                                     0x3: [ # 3-bytes # shouldn't happen
                                         Case(processed_ad[0:2], {
                                             0x0: [
                                                 NextValue(current_sel, 0xE),
                                             ],
                                             0x1: [
                                                 NextValue(current_sel, 0x7),
                                             ],
                                             0x2: [
                                                 NextValue(current_sel, 0x3),
                                             ],
                                             0x3: [
                                                 NextValue(current_sel, 0x1),
                                             ],
                                         }),
                                     ],
                                 }),
                                 NextState("FinishWrite"),
                          )
            )
            copro_fsm.act("Read",
                          STERM_oe.eq(1), # enable STERM
                          STERM_o_n.eq(0), # ACK 32-bits for 1 cycle
                          CBACK_oe.eq(1),
                          CBACK_o_n.eq(1),
                          BERR_oe.eq(1),
                          BERR_o_n.eq(1),
                          #NextValue(D_latch, regs[A_latch[2:5]]),
                          #D_rev_o.eq(regs[A_latch[2:5]]),
                          NextValue(D_latch, Cat(regs[A_latch[2:5]][24:32], regs[A_latch[2:5]][16:24], regs[A_latch[2:5]][ 8:16], regs[A_latch[2:5]][ 0: 8])),
                          D_rev_o.eq(        Cat(regs[A_latch[2:5]][24:32], regs[A_latch[2:5]][16:24], regs[A_latch[2:5]][ 8:16], regs[A_latch[2:5]][ 0: 8])),
                          D_oe.eq(1),
                          reg_re[Cat(~A_latch[1], A_latch[2:5])].eq(1), # one cycle strobe for 16-bits half
                          If(do_long,
                             reg_re[Cat(Signal(1, reset = 0), A_latch[2:5])].eq(1), # one cycle strobe for 32-bits word as well
                          ),
                          NextState("FinishRead"),
            )
            copro_fsm.act("FinishRead",
                          D_oe.eq(1), # keep data one more cycle
                          D_rev_o.eq(D_latch),
                          STERM_oe.eq(1), # enable STERM
                          STERM_o_n.eq(1), # ACK finished after 1 cycle
                          CBACK_oe.eq(1),
                          CBACK_o_n.eq(1),
                          BERR_oe.eq(1),
                          BERR_o_n.eq(1),
                          NextState("Idle"),
            )
            copro_fsm.act("FinishWrite", # unnecessary ?
                          STERM_oe.eq(1), # enable STERM
                          STERM_o_n.eq(1), # finish ACK after one cycle
                          CBACK_oe.eq(1),
                          CBACK_o_n.eq(1),
                          BERR_oe.eq(1),
                          BERR_o_n.eq(1),
                          If(current_sel[0],
                             NextValue(regs[A_latch[2:5]][ 0: 8], D_rev_i[24:32]),
                             reg_we[Cat(Signal(1, reset = 0), A_latch[2:5])].eq(1),
                          ),
                          If(current_sel[1],
                             NextValue(regs[A_latch[2:5]][ 8:16], D_rev_i[16:24]),
                             reg_we[Cat(Signal(1, reset = 0), A_latch[2:5])].eq(1),
                          ),
                          If(current_sel[2],
                             NextValue(regs[A_latch[2:5]][16:24], D_rev_i[ 8:16]),
                             reg_we[Cat(Signal(1, reset = 1), A_latch[2:5])].eq(1),
                          ),
                          If(current_sel[3],
                             NextValue(regs[A_latch[2:5]][24:32], D_rev_i[ 0: 8]),
                             reg_we[Cat(Signal(1, reset = 1), A_latch[2:5])].eq(1),
                          ),
                          NextState("Idle"),
            )

            ## copro debug
                
            if (False):
                led0 = platform.request("user_led", 0)
                led1 = platform.request("user_led", 1)
                led2 = platform.request("user_led", 2)
                led3 = platform.request("user_led", 3)
                led4 = platform.request("user_led", 4)
                led5 = platform.request("user_led", 5)
                led6 = platform.request("user_led", 6)
                led7 = platform.request("user_led", 7)
                
                #seen_myself = Signal()
                #sync_cpu += [
                #    If(my_copro_space & cpu_mgt_cycle,
                #       seen_myself.eq(1)),
                #]
                
                seen_command_we = Signal()
                seen_response_re = Signal()
                seen_operand_re = Signal()
                seen_operand_we = Signal()
                sync_cpu += [
                    If(reg_we[4],
                       seen_command_we.eq(1),
                    ),
                    If(reg_re[1],
                       seen_response_re.eq(1),
                    ),
                    If(reg_re[8],
                       seen_operand_re.eq(1),
                    ),
                    If(reg_we[8],
                       seen_operand_we.eq(1),
                    ),
                ]
                
                #seen_read = Signal()
                #seen_write = Signal()
                #sync_cpu += [
                #    If(copro_fsm.ongoing("FinishRead"),
                #       seen_read.eq(1),
                #    ),
                #    If(copro_fsm.ongoing("FinishWrite"),
                #       seen_write.eq(1),
                #    ),
                #]
                
                #access_ctr = Signal(4)
                #sync_cpu += [
                #    If(copro_fsm.ongoing("FinishRead") | copro_fsm.ongoing("FinishWrite"),
                #       access_ctr.eq(access_ctr + 1),
                #    ),
                #]

                if (False):
                    seen_compute = Signal()
                    sync_cpu += [
                        If(~self.copro.fpu_compute_fsm.ongoing("Idle") & ~self.copro.fpu_compute_fsm.ongoing("Reset"),
                           seen_compute.eq(1),
                        ),
                    ]
                    
                    seen_frommem = Signal()
                    sync_cpu += [
                        If(~self.copro.fpu_memtofp_fsm.ongoing("Idle") & ~self.copro.fpu_memtofp_fsm.ongoing("Reset"),
                           seen_frommem.eq(1),
                        ),
                    ]
                    
                    seen_tomem = Signal()
                    sync_cpu += [
                        If(~self.copro.fpu_fptomem_fsm.ongoing("Idle") & ~self.copro.fpu_fptomem_fsm.ongoing("Reset"),
                           seen_tomem.eq(1),
                        ),
                    ]
                
                self.comb += [
                    led0.eq(~copro_fsm.ongoing("Idle")),
                    #led0.eq(~self.copro.krypto_fsm.ongoing("Idle")),
                    #led2.eq(self.copro.krypto_fsm.ongoing("WaitReadResponse1")),
                    #led3.eq(self.copro.krypto_fsm.ongoing("GetData")),
                    #led2.eq(seen_read),
                    #led3.eq(seen_write),
                    led1.eq(seen_operand_re),
                    led2.eq(seen_operand_we),
                    led3.eq(seen_response_re),
                    
                    #led4.eq(seen_myself),
                    #led5.eq(my_copro_space & cpu_mgt_cycle),
                    #led6.eq(my_copro_space),
                    #led7.eq(cpu_mgt_cycle),
                    #led4.eq(self.copro.krypto_fsm.ongoing("WaitReadResponse2")),
                    #led5.eq(self.copro.krypto_fsm.ongoing("GetReg")),
                    #led6.eq(self.copro.krypto_fsm.ongoing("Compute1")),
                    #led7.eq(self.copro.krypto_fsm.ongoing("Compute2")),
                    #led4.eq(self.copro.krypto_fsm.ongoing("Temporary")),
                    #led5.eq(self.copro.krypto_fsm.ongoing("GetReg")),
                    #led6.eq(self.copro.krypto_fsm.ongoing("Compute1") | self.copro.krypto_fsm.ongoing("Compute2") | self.copro.krypto_fsm.ongoing("Compute3") | self.copro.krypto_fsm.ongoing("Compute4")),
                    #led7.eq(self.copro.krypto_fsm.ongoing("WaitReadOperand")),
                    #led4.eq(self.copro.krypto_fsm.ongoing("Temporary")),
                    #led5.eq(0),
                    #led6.eq(self.copro.operand_idx[0]),
                    #led7.eq(self.copro.operand_idx[1]),
                    #led4.eq(regs[2][16:32] == 0x7000),
                    #led5.eq(regs[2][16:32] == 0x0070), # !!!!
                    #led6.eq(regs[2][16:32] != 0x0000),
                    #led7.eq(regs[2][ 0:16] != 0x0000)
                    #led6.eq(seen_command_we),
                    #led7.eq(seen_response_re),
                    
                    #led0.eq(~self.copro.fpu_memtofp_fsm.ongoing("Idle")),
                    #led1.eq(~self.copro.fpu_compute_fsm.ongoing("Idle")),
                    #led2.eq(~self.copro.fpu_fptomem_fsm.ongoing("Idle")),
                    #led3.eq(seen_command_we),
                    #led4.eq(seen_response_re),
                    #led3.eq(seen_compute),
                    #led4.eq(seen_tomem),
                    #led5.eq(seen_frommem),
                    #led5.eq(self.copro.regs_fp[0] == 0),
                    #led6.eq(self.copro.regs_fp[0][80]), # 
                    #led7.eq(self.copro.regs_fp[0][79]), # 
                    
                    #led0.eq(0),
                    #led1.eq(0),
                    #led2.eq(0),
                    #led3.eq(0),
                    led4.eq(0),
                    led5.eq(0),
                    led6.eq(0), 
                    led7.eq(0),
                ]

        ############################ DEBUG

        # cycle time logic analyzer
        if (False):
            buffer_addr_bits = 25 # 32 MiWords or 128 MiB, 'cause we can!
            buffer_data_bits = 16 # probably overkill ?
            addr_bits = 8
            addr_bak = Signal(addr_bits)
            
            check_adr_ctr = Signal(buffer_addr_bits)
            latency = Signal(buffer_data_bits)
            read_or_write = Signal()
            
            self.submodules.write_fifo_check_latency  = write_fifo_check_latency =  ClockDomainsRenamer({"read": "sys",  "write": cd_cpu})(AsyncFIFOBuffered(width=(buffer_data_bits+1+buffer_addr_bits), depth=8))
            from litex.soc.interconnect import wishbone
            wishbone_check = wishbone.Interface(data_width=soc.bus.data_width)
            soc.bus.add_master(name="PDSBridgeToWishbone_Check_Write", master=wishbone_check)
            # deal with emptying the Write FIFO to the write WB
            self.comb += [ wishbone_check.cyc.eq(write_fifo_check_latency.readable),
                           wishbone_check.stb.eq(write_fifo_check_latency.readable),
                           wishbone_check.we.eq(1),
                           wishbone_check.adr.eq(Signal(30, reset = 0x20000000) | write_fifo_check_latency.dout[buffer_data_bits+1:buffer_data_bits+1+buffer_addr_bits]),
                           #wishbone_check.dat_w.eq(write_fifo_check_latency.dout[0:buffer_data_bits] | Cat(Signal(31, reset = 0), write_fifo_check_latency.dout[buffer_data_bits:buffer_data_bits+1])),
                           wishbone_check.dat_w.eq(Cat(write_fifo_check_latency.dout[0:buffer_data_bits], # %buffer_data_bits
                                                       Signal(32-(buffer_data_bits+addr_bits+1), reset = 0),
                                                       addr_bak, # %addr_bits
                                                       write_fifo_check_latency.dout[buffer_data_bits:buffer_data_bits+1])), # %1
                           wishbone_check.sel.eq(0xF),
                           write_fifo_check_latency.re.eq(wishbone_check.ack),
                           write_fifo_check_latency.din.eq(Cat(latency, read_or_write, check_adr_ctr)),
            ]
            record = Signal()
            do_write = Signal()
            timeout = Signal(10) # so we don't overload the wishbone
            sync_cpu += [
                If(timeout,
                   timeout.eq(timeout - 1),
                ),
                If(do_write,
                   do_write.eq(0),
                ),
                If(~AS_i_n & (A_i[28:32] == 0xF) & (timeout == 0) & ~record, # start with address in memory range
                   latency.eq(0),
                   record.eq(1),
                   read_or_write.eq(RW_i_n),
                   addr_bak.eq(A_i[32-addr_bits:32]),
                ).Else(
                    latency.eq(latency + 1),
                ),
                If((~STERM_i_n) & record, # only work if sync memory controller (IIsi) or other sync device
                   record.eq(0),
                   do_write.eq(1),
                   check_adr_ctr.eq(check_adr_ctr + 1),
                   timeout.eq(1023),
                ),
            ]
            self.comb += [
                write_fifo_check_latency.we.eq(do_write),
                #led7.eq(record),
            ]
        
        if (False):
            led0 = platform.request("user_led", 0)
            led1 = platform.request("user_led", 1)
            led2 = platform.request("user_led", 2)
            led3 = platform.request("user_led", 3)
            led4 = platform.request("user_led", 4)
            led5 = platform.request("user_led", 5)
            led6 = platform.request("user_led", 6)
            led7 = platform.request("user_led", 7)

            self.comb += [
                led0.eq(~slave_fsm.ongoing("Idle")),
                led1.eq(0),
                led2.eq(0),
                led3.eq(0),
                #led1.eq(~AS_i_n),
                #led2.eq(~RW_i_n),
                #led3.eq(~CBREQ_i_n ),
                
                led4.eq(0),
                led5.eq(0),
                led6.eq(0),
                led7.eq(0),
                #led4.eq(my_slot_space),
                #led5.eq(my_superslot_space),
                #led6.eq(my_mem_space),
                #led7.eq(cpu_mgt_cycle),
            ]


        if (trace_inst_fifo != None):
            #trace_enabled = Signal()
            #sync_cpu += [
            #    #If(~AS_i_n & RW_i_n & (A_i[8:32] == 0x408416), # vicinity of call to ispmmu
            #    #   trace_enabled.eq(1)
            #    #),
            #    If(~AS_i_n & RW_i_n & (A_i[24:32] == 0x20),
            #       trace_enabled.eq(1)
            #    ),
            #]
            #self.comb += [
            #    trace_inst_fifo.din[ 0: 8].eq(A_i[24:32]),
            #    trace_inst_fifo.din[ 8:16].eq(A_i[16:24]),
            #    trace_inst_fifo.din[16:24].eq(A_i[ 8:16]),
            #    trace_inst_fifo.din[24:32].eq(A_i[ 0: 8]),
            #]
            #self.comb += [
            #    trace_inst_fifo.din.eq(D_rev_i),
            #]
            self.submodules.trace_fsm = trace_fsm = ClockDomainsRenamer(cd_cpu)(FSM(reset_state="Reset"))
            trace_fsm.act("Reset",
                          trace_inst_fifo.we.eq(0),
                          NextState("Idle")
            )
            trace_fsm.act("Idle",
                          #If(trace_enabled & ~AS_i_n & RW_i_n & (A_i[20:32] == 0x408), # read from ROM
                          #If(trace_enabled & ~AS_i_n & (A_i[24:32] == 0x20), # read or write to my_mem
                          If(my_copro_space & cpu_mgt_cycle & ~AS_i_n,
                             trace_inst_fifo.we.eq(1),
                             trace_inst_fifo.din[ 0: 8].eq(A_i[24:32]),
                             trace_inst_fifo.din[ 8:16].eq(A_i[16:24]),
                             trace_inst_fifo.din[16:24].eq(A_i[ 8:16]),
                             trace_inst_fifo.din[24:32].eq(A_i[ 0: 8]),
                             #NextState("Wait"),
                             NextState("Delay"),
                          )
            )
            trace_fsm.act("Delay",
                          trace_inst_fifo.we.eq(1),
                          trace_inst_fifo.din.eq(D_rev_i),
                          NextState("Wait"),
            )
            trace_fsm.act("Wait",
                          trace_inst_fifo.we.eq(0),
                          #If(AS_i_n,
                             NextState("Idle"),
                          #)
            )
