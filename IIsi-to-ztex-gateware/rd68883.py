from migen import *
from migen.genlib.fifo import *


def null_primitive(CA = 0, PC = 0, IA = 0, PF = 0, TF = 0):
    val = 0x0800
    val = val | (CA << 15)
    val = val | (PC << 14)
    val = val | (IA <<  8)
    val = val | (PF <<  1)
    val = val | (TF <<  0)
    return val

def ea_transfer_primitive(CA = 0, PC = 0, DR = 0, Valid = None, Length = None):
    assert(Valid != None)
    assert(Length != None)
    val = 0x1000
    val = val | (CA << 15)
    val = val | (PC << 14)
    val = val | (DR << 13)
    val = val | (Valid << 8) # 3 bits
    val = val | (Length << 0) # 8 bits
    return val

def transfer_singlereg_primitive(CA = 0, PC = 0, DR = 0, DA = 0, Register = 0):
    val = 0x0C00
    val = val | (CA << 15)
    val = val | (PC << 14)
    val = val | (DR << 13)
    val = val | (DA <<  3)
    val = val | (Register << 0) # 3 bits
    return val

class rd68883(Module):
    def __init__(self, platform, cd_fpu = "cpu"):

        # RESP_IDLE = 0x0802
        RESP_IDLE = null_primitive(PF = 1)
        print(f"RESP_IDLE is \${RESP_IDLE:x}")
        # RESP_ONGOING = 0x8900
        RESP_ONGOING = null_primitive(CA = 1, IA = 1)
        print(f"RESP_ONGOING is \${RESP_ONGOING:x}")
        # RESP_EA_TRANSFER = 0x9610
        RESP_EA_TRANSFER = ea_transfer_primitive(CA = 1, Valid = 6, Length = 16)
        print(f"RESP_EA_TRANSFER is \${RESP_EA_TRANSFER:x}")
        # RESP_SEND_REG = 0x8C00
        RESP_SEND_REG = transfer_singlereg_primitive(CA = 1)
        print(f"RESP_SEND_REG is \${RESP_SEND_REG:x}")
        # RESP_RECV_REG = 0x2C00
        RESP_RECV_REG = transfer_singlereg_primitive(DR = 1)
        print(f"RESP_RECV_REG is \${RESP_RECV_REG:x}")

        fpu_sync = getattr(self.sync, cd_fpu)
        
        # register bank (32 bits) and aliases (16 or 32 bits)
        self.regs = Array(Signal(32) for x in range(0,8))
        response  = self.regs[0][16:32]
        control   = self.regs[0][ 0:16]
        save      = self.regs[1][16:32]
        restore   = self.regs[1][ 0:16]
        operation = self.regs[2][16:32]
        command   = self.regs[2][ 0:16]
        rsvd0     = self.regs[3][16:32]
        condition = self.regs[3][ 0:16]
        operand   = self.regs[4]
        regselect = self.regs[5][16:32]
        rsvd1     = self.regs[5][ 0:16]
        instaddr  = self.regs[6]
        operaddr  = self.regs[7]
        
        # read/write strobe (16 bits granularity)
        self.reg_re = reg_re = Array(Signal(1) for x in range(0,16))
        self.reg_we = reg_we = Array(Signal(1) for x in range(0,16))
        
        
        #self.cir_response  = response  = Signal(16, reset = RESP_IDLE) # $00  R
        #self.cir_control   = control   = Signal(16) # $02  W
        #self.cir_save      = save      = Signal(16) # $04  R
        #self.cir_restore   = restore   = Signal(16) # $06  R/W
        #self.cir_operation = operation = Signal(16) # $08  R/W, W ??? *
        #self.cir_command   = command   = Signal(16) # $0A  W
        #self.cir_rsvd0     = rsvd0     = Signal(16) # $0C  --
        #self.cir_condition = condition = Signal(16) # $0E  W
        #self.cir_operand   = operand   = Signal(32) # $10  R/W
        #self.cir_regselect = regselect = Signal(16) # $14  R (upper only)
        #self.cir_rsvd1     = rsvd1     = Signal(16) # $16  --
        #self.cir_instaddr  = instaddr  = Signal(32) # $18  W
        #self.cir_operaddr  = operaddr  = Signal(32) # $1C  R/W *
        
        # 16-bits granularity
        # delay by 1 cycle, otherwise it seems the actual registers aren't ready when the strobe arrives
        response_re = Signal()
        command_we = Signal()
        operand_re = Signal()
        operand_we = Signal()
        fpu_sync += [
            If(reg_re[1],
               response_re.eq(1),
            ).Else(
                response_re.eq(0),
            ),
            If(reg_re[8],
               operand_re.eq(1),
            ).Else(
                operand_re.eq(0),
            ),
            If(reg_we[4],
               command_we.eq(1),
            ).Else(
                command_we.eq(0),
            ),
            If(reg_we[8],
               operand_we.eq(1),
            ).Else(
                operand_we.eq(0),
            ),
        ]
        
        #self.cir_response_re  = response_re  = Signal(1)
        ## self.cir_control_we   = control_we   = Signal(1)
        ## self.cir_save_re      = save_re      = Signal(1)
        ## self.cir_restore_re   = restore_re   = Signal(1)
        ## self.cir_restore_we   = restore_we   = Signal(1)
        ## self.cir_operation_we = operation_we = Signal(1)
        #self.cir_command_we   = command_we   = Signal(1)
        ## self.cir_condition_we = condition_we = Signal(1)
        #self.cir_operand_re   = operand_re   = Signal(1)
        #self.cir_operand_we   = operand_we   = Signal(1)
        ## self.cir_regselect_re = regselect_re = Signal(1)
        ## self.cir_instaddr_we  = instaddr_we  = Signal(1)
        ## self.cir_operaddr_re  = operaddr_re  = Signal(1)
        ## self.cir_operaddr_we  = operaddr_we  = Signal(1)
        
        ####

        # FP registers

        self.regs_fp = regs_fp = Array(Signal(81) for x in range(8))
        regs_fpcr = Signal(32)
        regs_fpsr = Signal(32)
        regs_fpiar = Signal(32)

        # for command word
        #
        opclass = command[13:16]
        rx = command[10:13]
        ry = command[7:10]
        extension = command[0:7]

        # Useful constant
        Valid_Memory = 6
        Valid_Data = 5

        # buffers
        data_type = Signal(3)
        op_cycle = Signal(2)
        operands = Array(Signal(32) for x in range(3))
        reg_idx = Signal(3)
        opcode = Signal(7)
        decoded_operand = Signal(81)

        # conversion
        conv_32_81_in = Signal(64)
        conv_32_81_out = Signal(81)
        conv_64_81_in = Signal(64)
        conv_64_81_out = Signal(81)
        conv_79_81_in = Signal(79)
        conv_79_81_out = Signal(81)

        internal_command_layout = [
            ("operand", 81),
            ("regin", 3),
            ("regout", 3),
            ("regormem", 1),
            ("opcode", 7),
        ]
        self.submodules.compute_fifo = compute_fifo = ClockDomainsRenamer(cd_fpu)(SyncFIFOBuffered(width=layout_len(internal_command_layout), depth=4))
        compute_fifo_din = Record(internal_command_layout)
        compute_fifo_dout = Record(internal_command_layout)
        self.comb += [
            compute_fifo_dout.raw_bits().eq(compute_fifo.dout),
            compute_fifo.din.eq(compute_fifo_din.raw_bits()),
        ]

        fp32_layout = [
            ( "sign", 1),
            ( "exponent", 8),
            ( "mantissa", 23),
        ]
        fp64_layout = [
            ( "sign", 1),
            ( "exponent", 11),
            ( "mantissa", 52),
        ]
        fp80_layout = [
            ( "sign", 1),
            ( "exponent", 15),
            ( "zero", 16),
            ( "leading1", 1),
            ( "mantissa", 63),
        ]
        fp79_layout = [
            ( "sign", 1),
            ( "exponent", 15),
            ( "mantissa", 63),
        ]

        operand_to_fp32 = Record(fp32_layout)
        operand_to_fp64 = Record(fp64_layout)
        operand_to_fp80 = Record(fp80_layout)
        operand_to_fp79 = Record(fp79_layout)

        self.comb += [
            operand_to_fp32.raw_bits().eq(operand),
            operand_to_fp64.raw_bits().eq(Cat(operand, operands[1])), # CHECKME: order ?
            operand_to_fp80.raw_bits().eq(Cat(operand, operands[1], operands[2])), # CHECKME: order ?
            operand_to_fp79.sign.eq(operand_to_fp80.sign),
            operand_to_fp79.exponent.eq(operand_to_fp80.exponent),
            operand_to_fp79.mantissa.eq(operand_to_fp80.mantissa),
        ]
        

        self.submodules.fpu_memtofp_fsm = fpu_memtofp_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))

        fpu_memtofp_fsm.act("Reset",
                       NextState("Idle"),
        )
        fpu_memtofp_fsm.act("Idle",
                       If(command_we & (opclass == 2), # 'b010
                          NextValue(data_type, rx),
                          NextValue(reg_idx, ry),
                          NextValue(opcode, extension),
                          Case(rx, {
                              # long word integer
                              0x0: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Data,Length=4)),
                                     NextValue(op_cycle,0),
                              ],
                              # FP32
                              0x1: [ NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=0,Valid=Valid_Data,Length=4)),
                                     NextValue(op_cycle,0),
                              ],
                              # FP80
                              0x2: [ NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=0,Valid=Valid_Memory,Length=12)),
                                     NextValue(op_cycle,2),
                              ],
                              # pack real, static k
                              0x3: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Memory,Length=12)),
                                     NextValue(op_cycle,2),
                              ], # might need static k ?
                              # word integer
                              0x4: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Memory,Length=2)),
                                     NextValue(op_cycle,0),
                              ],
                              # FP64:
                              0x5: [ NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=0,Valid=Valid_Memory,Length=8)),
                                     NextValue(op_cycle,1),
                              ],
                              # byte integer
                              0x6: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Memory,Length=1)),
                                     NextValue(op_cycle,0),
                              ],
                              # pack real,dynamic k
                              0x7: [ NextValue(response, null_primitive(PF=1)), # FIXME
                                     NextValue(op_cycle,0),
                              ]
                          }),
                          NextState("WaitReadResponse1"),
                       ),
        )

        fpu_memtofp_fsm.act("WaitReadResponse1",
                       If(response_re,
                          NextValue(response, null_primitive(CA=1,IA=1)), # ongoing
                          NextState("GetData"),
                       ),
                       # FIXME: illegal stuff
        )
        fpu_memtofp_fsm.act("GetData",
                       If(operand_we,
                          NextValue(op_cycle, op_cycle - 1),
                          NextValue(operands[op_cycle], operand),
                          If(op_cycle == 0, # fixme: non-FP ?
                             NextValue(response, null_primitive(PF=1)), # IDLE
                             NextState("Idle"),
                             compute_fifo_din.regin.eq(0),
                             compute_fifo_din.regout.eq(reg_idx),
                             compute_fifo_din.regormem.eq(1),
                             compute_fifo_din.opcode.eq(opcode),
                             compute_fifo.we.eq(1),
                             Case(data_type, {
                                 0x1: [
                                     compute_fifo_din.operand.eq(conv_32_81_out),
                                     conv_32_81_in.eq(operand_to_fp32.raw_bits()),
                                 ],
                                 0x2: [
                                     compute_fifo_din.operand.eq(conv_79_81_out),
                                     conv_79_81_in.eq(operand_to_fp79.raw_bits()), # FIXME: ignoring leading 1
                                 ],
                                 0x5: [
                                     compute_fifo_din.operand.eq(conv_64_81_out),
                                     conv_64_81_in.eq(operand_to_fp64.raw_bits()),
                                 ],
                             }),
                          ),
                       ),
                       # FIXME: illegal stuff
        )


        operand0 = Signal(81)
        operand1 = Signal(81)
        delay = Signal(8)

        out_pipelines = Array(Signal(81) for x in range(2))
        pip_idx = Signal(3)

        self.submodules.fpu_compute_fsm = fpu_compute_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))
        fpu_compute_fsm.act("Reset",
                       NextValue(response, null_primitive(PF=1)), # IDLE
                       NextState("Idle"),
        )
        fpu_compute_fsm.act("Idle",
                       If(compute_fifo.re,
                          If(compute_fifo_dout.regormem,
                             NextValue(operand0, compute_fifo_din.operand),
                          ).Else(
                             NextValue(operand0, regs_fp[compute_fifo_din.regin]),
                          ),
                          NextValue(operand1, regs_fp[compute_fifo_din.regout]),
                          NextState("Compute"),
                       ),
        )
        fpu_compute_fsm.act("Compute",
                            Case(compute_fifo_dout.opcode, {
                                0x00: [ # FPMove
                                    NextValue(regs_fp[compute_fifo_din.regout], operand0),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                0x22: [ # FPAdd
                                    NextValue(delay, 1),
                                    NextValue(pip_idx, 0),
                                    NextState("Wait"),
                                ],
                                0x23: [ # FPMul
                                    NextValue(delay, 1),
                                    NextValue(pip_idx, 1),
                                    NextState("Wait"),
                                ],
                                "default": [ # oups
                                    NextValue(delay, 1),
                                    NextValue(pip_idx, 0),
                                    NextState("Wait"),
                                ],
                            }),
        )
        fpu_compute_fsm.act("Wait",
                            NextValue(delay, delay - 1),
                            If(delay == 0,
                               NextValue(regs_fp[compute_fifo_din.regout], out_pipelines[pip_idx]),
                               compute_fifo.re.eq(1),
                               NextState("Idle"),
                            ),
        )

        self.specials += Instance("InputIEEE_8_23_to_15_63_comb_uid2",
                                  i_X = conv_32_81_in,
                                  o_R = conv_32_81_out,)
        platform.add_source("InputIEEE_8_23_to_15_63_comb_uid2.vhdl", "vhdl")

        self.specials += Instance("InputIEEE_11_52_to_15_63_comb_uid2",
                                  i_X = conv_64_81_in,
                                  o_R = conv_64_81_out,)
        platform.add_source("InputIEEE_11_52_to_15_63_comb_uid2.vhdl", "vhdl")
        
        self.specials += Instance("InputIEEE_15_63_to_15_63_comb_uid2",
                                  i_X = conv_79_81_in,
                                  o_R = conv_79_81_out,)
        platform.add_source("InputIEEE_15_63_to_15_63_comb_uid2.vhdl", "vhdl")
        
        self.specials += Instance("FPAdd_15_63_Freq100_uid2",
                                  i_clk = ClockSignal(cd_fpu),
                                  i_X = operand0,
                                  i_Y = operand1,
                                  o_R = out_pipelines[0],)
        platform.add_source("FPAdd_15_63_Freq100_uid2.vhdl", "vhdl")

        self.specials += Instance("FPMult_15_63_uid2_Freq300_uid3",
                                  i_clk = ClockSignal(cd_fpu),
                                  i_X = operand0,
                                  i_Y = operand1,
                                  o_R = out_pipelines[1],)
        platform.add_source("FPMult_15_63_uid2_Freq300_uid3.vhdl", "vhdl")
