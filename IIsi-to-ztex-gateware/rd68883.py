from migen import *
from migen.genlib.fifo import *

from copro import *

class ctz8_comb(Module):
    def __init__(self):
        self.input = input = Signal(8)
        self.output = output = Signal(3)
        self.valid = valid = Signal(1)

        self.comb += [
            If(input[0],
               output.eq(0),
            ).Elif(input[1],
                   output.eq(1),
            ).Elif(input[2],
                   output.eq(2),
            ).Elif(input[3],
                   output.eq(3),
            ).Elif(input[4],
                   output.eq(4),
            ).Elif(input[5],
                   output.eq(5),
            ).Elif(input[6],
                   output.eq(6),
            ).Elif(input[7],
                   output.eq(7),
            ),
            valid.eq(input[0] | input[1] | input[2] | input[3] | input[4] | input[5] | input[6] | input[7]),
        ]

#class sum8bits_comb(Module):
#    def __init__(self):
#        self.input = input = Signal(8)
#        self.output = output = Signal(4)
#        self.comb += [
#            output.eq(Cat(input[0], Signal(3, reset = 0)) +
#                      Cat(input[1], Signal(3, reset = 0)) +
#                      Cat(input[2], Signal(3, reset = 0)) +
#                      Cat(input[3], Signal(3, reset = 0)) +
#                      Cat(input[4], Signal(3, reset = 0)) +
#                      Cat(input[5], Signal(3, reset = 0)) +
#                      Cat(input[6], Signal(3, reset = 0)) +
#                      Cat(input[7], Signal(3, reset = 0))),
#        ]

class rd68883(Copro):
    def __init__(self, platform, cd_fpu = "cpu"):
        
        super().__init__(cd_copro = cd_fpu)
        
        fpu_sync = getattr(self.sync, cd_fpu)

        ### shortcuts to copro registers
        response  = self.response
        command   = self.command
        operand   = self.operand
        
        response_re = self.response_re
        command_we  = self.command_we
        operand_re  = self.operand_re
        operand_we  = self.operand_we

        ### FP registers from '881/'882
        self.regs_fp = regs_fp = Array(Signal(81, reset = (0x08DEAD0000BEEF0000000 | x)) for x in range(8))
        regs_fpcr = Signal(32) # HANDLEME
        regs_fpsr = Signal(32) # HANDLEME
        regs_fpiar = Signal(32) # HANDLEME

        ### shortcuts for command word
        opclass = command[13:16]
        rx = command[10:13]
        ry = command[7:10]
        extension = command[0:7]

        ### Useful constant
        Valid_Control_Alterable = 0
        Valid_Data_Alterable = 1
        Valid_Memory_Alterable = 2
        Valid_Alterable = 3
        valid_Control = 4
        Valid_Data = 5
        Valid_Memory = 6
        Valid_Any = 7

        ### buffers
        data_type = Signal(3)
        op_cycle = Signal(2)
        operands = Array(Signal(32) for x in range(3))
        reg_idx = Signal(3)
        opcode = Signal(7)

        ### type conversion stuff
        ## signals to 'in' blocks (to FloPoCo type)
        conv_32_81_in = Signal(32)
        conv_32_81_out = Signal(81)
        conv_64_81_in = Signal(64)
        conv_64_81_out = Signal(81)
        conv_79_81_in = Signal(79)
        conv_79_81_out = Signal(81)
        ## signals to 'out' blocks (to IEEE types)
        conv_81_all_in = Signal(81)
        conv_81_79_out = Signal(79)
        conv_81_64_out = Signal(64)
        conv_81_32_out = Signal(32)

        ## data layout
        fp32_layout = [
            ( "mantissa", 23),
            ( "exponent", 8),
            ( "sign", 1),
        ]
        fp64_layout = [
            ( "mantissa", 52),
            ( "exponent", 11),
            ( "sign", 1),
        ]
        # fp80 is stored in 96 bits, and the leading 1 of the mantissa is explicit...
        fp80_layout = [
            ( "mantissa", 63),
            ( "leading1", 1),
            ( "zero", 16), # zero-padding from 80 to 96 bits
            ( "exponent", 15),
            ( "sign", 1),
        ]
        fp79_layout = [
            ( "mantissa", 63),
            ( "exponent", 15),
            ( "sign", 1),
        ]

        ## some conversion wirings
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
        self.comb += [
            conv_32_81_in.eq(operand_to_fp32.raw_bits()),
            conv_79_81_in.eq(operand_to_fp79.raw_bits()), # FIXME: ignoring leading 1
            conv_64_81_in.eq(operand_to_fp64.raw_bits()),
        ]

        fp80_to_operand = Record(fp80_layout)
        fp79_to_operand = Record(fp79_layout)
        self.comb += [
            fp80_to_operand.sign.eq(fp79_to_operand.sign),
            fp80_to_operand.exponent.eq(fp79_to_operand.exponent),
            fp80_to_operand.zero.eq(0),
            #fp80_to_operand.leading1.eq(1), # FIXME!!! this will break zeroes...
            fp80_to_operand.leading1.eq(fp79_to_operand.exponent[ 0] |
                                        fp79_to_operand.exponent[ 1] |
                                        fp79_to_operand.exponent[ 2] |
                                        fp79_to_operand.exponent[ 3] |
                                        fp79_to_operand.exponent[ 4] |
                                        fp79_to_operand.exponent[ 5] |
                                        fp79_to_operand.exponent[ 6] |
                                        fp79_to_operand.exponent[ 7] |
                                        fp79_to_operand.exponent[ 8] |
                                        fp79_to_operand.exponent[ 9] |
                                        fp79_to_operand.exponent[10] |
                                        fp79_to_operand.exponent[11] |
                                        fp79_to_operand.exponent[12] |
                                        fp79_to_operand.exponent[13] |
                                        fp79_to_operand.exponent[14]
            ), # FIXME!!!
            fp80_to_operand.mantissa.eq(fp79_to_operand.mantissa),
            fp79_to_operand.raw_bits().eq(conv_81_79_out),
        ]
        
        ### internal command stuff
        ## command layout
        internal_command_layout = [
            ("operand", 81),
            ("regin", 3),
            ("regout", 3),
            ("regormem", 1),
            ("opcode", 7),
        ]
        ## command FIFO (sync for now)
        self.submodules.compute_fifo = compute_fifo = ClockDomainsRenamer(cd_fpu)(SyncFIFOBuffered(width=layout_len(internal_command_layout), depth=8))
        compute_fifo_din = Record(internal_command_layout)
        compute_fifo_dout = Record(internal_command_layout)
        self.comb += [
            compute_fifo_dout.raw_bits().eq(compute_fifo.dout),
            compute_fifo.din.eq(compute_fifo_din.raw_bits()),
        ]

        # IMPROVEME: use some proper memory? 
        const_table = Array(Signal(80, reset = 0) for x in range(64))

        # **********************************************************************************
        ### General, Mem-to-FP FSM (opclass 010)
        self.submodules.fpu_memtofp_fsm = fpu_memtofp_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))
        fpu_memtofp_fsm.act("Reset",
                       NextState("Idle"),
        )
        fpu_memtofp_fsm.act("Idle",
                       If(command_we & (opclass == 2),
                          NextValue(data_type, rx),
                          NextValue(reg_idx, ry),
                          NextValue(opcode, extension),
                          Case(rx, {
                              # long word integer
                              0x0: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Data,Length=4)),
                                     NextValue(op_cycle,0),
                                     NextState("WaitReadResponse1"),
                              ],
                              # FP32
                              0x1: [ NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=0,Valid=Valid_Data,Length=4)),
                                     NextValue(op_cycle,0),
                                     NextState("WaitReadResponse1"),
                              ],
                              # FP80
                              0x2: [ NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=0,Valid=Valid_Memory,Length=12)),
                                     NextValue(op_cycle,2),
                                     NextState("WaitReadResponse1"),
                              ],
                              # pack real, static k
                              0x3: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Memory,Length=12)),
                                     NextValue(op_cycle,2),
                                     NextState("WaitReadResponse1"),
                              ], # might need static k ?
                              # word integer
                              0x4: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Memory,Length=2)),
                                     NextValue(op_cycle,0),
                                     NextState("WaitReadResponse1"),
                              ],
                              # FP64:
                              0x5: [ NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=0,Valid=Valid_Memory,Length=8)),
                                     NextValue(op_cycle,1),
                                     NextState("WaitReadResponse1"),
                              ],
                              # byte integer
                              0x6: [ NextValue(response, ea_transfer_primitive(CA=1,PC=0,DR=0,Valid=Valid_Memory,Length=1)),
                                     NextValue(op_cycle,0),
                                     NextState("WaitReadResponse1"),
                              ],
                              # not regular stuff, movecr
                              0x7: [ 
                                  compute_fifo_din.regin.eq(0),
                                  compute_fifo_din.regout.eq(ry),
                                  compute_fifo_din.regormem.eq(1),
                                  compute_fifo_din.opcode.eq(0x0), # use FMove
                                  compute_fifo.we.eq(1),
                                  #compute_fifo_din.operand.eq(Cat(const_table[extension[0:6]][0:63], const_table[extension[0:6]][64:80], Signal(2, reset = 0x1))), # FIXME: upper two bits should be 0 for 0.0 (# 0xF)
                                  compute_fifo_din.operand.eq(Cat(const_table[extension[0:6]], Signal(1, reset = 0x0))),
                                  NextValue(response, null_primitive(PF=1)), # IDLE
                                  NextState("Idle"),
                              ]
                          }),
                       )
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
                                 ],
                                 0x2: [
                                     compute_fifo_din.operand.eq(conv_79_81_out),
                                 ],
                                 0x5: [
                                     compute_fifo_din.operand.eq(conv_64_81_out),
                                 ],
                             }),
                          ),
                       ),
                       # FIXME: illegal stuff
        )

        # **********************************************************************************
        ### General, FP-to-Mem FSM (opclass 011)
        self.submodules.fpu_fptomem_fsm = fpu_fptomem_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))

        fpu_fptomem_fsm.act("Reset",
                       NextState("Idle"),
        )
        fpu_fptomem_fsm.act("Idle",
                       If(command_we & (opclass == 3), # 'b011
                          NextValue(data_type, rx),
                          NextValue(reg_idx, ry),
                          NextValue(opcode, extension),
                          NextValue(response, null_primitive(CA=1, IA=1)),
                          NextState("WaitCompute"),
                       ),
        )
        fpu_fptomem_fsm.act("WaitCompute",
                            If(~compute_fifo.readable, # FIFO empty, let's go
                               #conv_81_all_in.eq(regs_fp[reg_idx]),
                               NextValue(conv_81_all_in, regs_fp[reg_idx]),
                               #Case(data_type, {
                               #    0x1: [
                               #        # FIXME FP32
                               #        #NextValue(op_cycle,0),
                               #    ],
                               #    0x2: [
                               #        #NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=12)),
                               #        fp79_to_operand.eq(conv_81_79_out),
                               #        #NextValue(operand,     fp80_to_operand.raw_bits()[64:96]),
                               #        #NextValue(operands[2], fp80_to_operand.raw_bits()[32:64]),
                               #        #NextValue(operands[1], fp80_to_operand.raw_bits()[ 0:32]),
                               #        #NextValue(op_cycle,2),
                               #    ],
                               #    0x5: [
                               #        # FIXME FP64
                               #        #NextValue(op_cycle,1),
                               #    ],
                               #}),
                               #NextState("WaitReadResponse1"),
                               NextState("SetupData"),
                            ),
                       # FIXME: illegal stuff
        )
        # for some reason, (in FP32/64) if we bypass StartData, something goes wrong...
        # maybe this is too quick and the response_re seen is from an earlier transaction?
        # FIXME: CHECKME: do we need to wait for a response_re after the command_we ?
        fpu_fptomem_fsm.act("SetupData",
                            Case(data_type, {
                                # 0x000 => Long
                                # 0x011 => packed static
                                # 0x100 => Word
                                # 0x110 => Bye
                                # 0x111 => packed dynamic
                                
                                0x1: [ # 0x001 => FP32
                                    #NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=4)),
                                    NextValue(operand, conv_81_32_out),
                                    NextValue(op_cycle,0),
                                    #NextState("WaitReadResponse1"),
                                ],
                                0x2: [ # 0x010 => FP80
                                    #NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=12)),
                                    NextValue(operand,     fp80_to_operand.raw_bits()[64:96]),
                                    NextValue(operands[2], fp80_to_operand.raw_bits()[32:64]),
                                    NextValue(operands[1], fp80_to_operand.raw_bits()[ 0:32]),
                                    #NextValue(fp79_to_operand.raw_bits(), conv_81_79_out),
                                    NextValue(op_cycle,2),
                                    #NextState("StartData"), # one more cycle of conversion, probably not needed - FIXME
                                ],
                                0x5: [ # 0x101 => FP64
                                    #NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=8)),
                                    NextValue(operand, conv_81_64_out[32:64]),
                                    NextValue(operands[1], conv_81_64_out[ 0:32]),
                                    NextValue(op_cycle,1),
                                    #NextState("WaitReadResponse1"),
                                ],
                            }),
                            #NextState("WaitReadResponse1"),
                            NextState("StartData")
                            # FIXME: illegal stuff
        )
        fpu_fptomem_fsm.act("StartData",
                            Case(data_type, {
                                0x1: [
                                    NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=4)),
                                ],
                                0x2: [
                                    NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=12)),
                                ],
                                0x5: [
                                    NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=8)),
                                ],
                            }),
                            NextState("WaitReadResponse1"),
        )
        fpu_fptomem_fsm.act("WaitReadResponse1",
                       If(response_re,
                          NextValue(response, null_primitive(CA=0,IA=1)), # ongoing
                          NextState("WaitData"),
                       ),
                       # FIXME: handle illegal stuff
        )
        fpu_fptomem_fsm.act("WaitData",
                            If(operand_re,
                               NextValue(op_cycle, op_cycle - 1),
                               If(op_cycle == 0,
                                  NextValue(response, null_primitive(PF = 1)),
                                  NextState("Idle"),
                               ).Else(
                                   NextValue(operand, operands[op_cycle]),
                               )
                            ),
        )

        # **********************************************************************************
        ### General, FP-to-FP FSM (opclass 000)

        self.submodules.fpu_fptofp_fsm = fpu_fptofp_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))

        fpu_fptofp_fsm.act("Reset",
                       NextState("Idle"),
        )
        fpu_fptofp_fsm.act("Idle",
                       If(command_we & (opclass == 0), # 'b000
                          #NextValue(reg_idx, ry),
                          #NextValue(opcode, extension),
                          NextValue(response, null_primitive(CA=1,IA=1)), # ongoing

                          compute_fifo_din.regin.eq(rx),
                          compute_fifo_din.regout.eq(ry),
                          compute_fifo_din.regormem.eq(0),
                          compute_fifo_din.opcode.eq(extension),
                          compute_fifo.we.eq(1),
                          compute_fifo_din.operand.eq(0),
                          NextState("Done"),
                       ),
        )
        fpu_fptofp_fsm.act("Done",
                           NextValue(response, null_primitive(PF=1)), # done
                           NextState("Idle"),
        )

        # **********************************************************************************
        ### General, move control FSM (opclass 100, 101)

        # **********************************************************************************
        ### General, move multiple (opclass 110, 111)
        # last bit of opclass is direction, so
        # 110 => (dr == 0) => mem-to-FP (e.g. context restore)
        # 111 => (dr == 1) => FP-to-mem (e.g. context save)
        fmovem_mode = Signal(2) # low-order bit is static (0) / dynamic (1) ; high-order bit is predecrement (0, FP7 to FP0) or postincrement (1, FP0 to FP7)
        #fmovem_dr = Signal(1) # direction - encoded in the opclass and different FSM
        fmovem_reglist_static = Signal(8) # the reglist in the 'static' case
        fmovem_reglist_regidx = Signal(3) # the number of the D register where the reglist is in the 'dynamic' case
        self.comb += [ fmovem_mode.eq(command[11:13]),
                       #fmovem_dr.eq(command[13]),
                       fmovem_reglist_static.eq(command[0:8]),
                       fmovem_reglist_regidx.eq(command[4:7]),
        ]

        pre_or_post_reg = Signal(1)
        regselect_buf = Signal(8) # the (live) value for the reglist, will go to 0 during transfer and we can alter it (removing 'done' bits one by one)
        self.submodules.ctz8 = ctz8 = ctz8_comb() # count-trailing-zero (== rightmost reg number)
        #self.submodules.sum8 = sum8 = sum8bits_comb() # sum of 8 bits (== number of regs)
        self.comb += [ ctz8.input.eq(regselect_buf), # dynamically change
        #               sum8.input.eq(self.regselect[0:8]), # static
        ]
        fmovem_reg_idx = Signal(3) # buffered copy of the index of the current FP register being processed
        
        self.submodules.fpu_fmovem_tofp_fsm = fpu_fmovem_tofp_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))
        fpu_fmovem_tofp_fsm.act("Reset",
                       NextState("Idle"),
        )
        fpu_fmovem_tofp_fsm.act("Idle",
                                If(command_we & (opclass == 6), # 'b110
                                   #NextValue(pre_or_post_reg, fmovem_mode[1]),
                                   #If(~compute_fifo.readable, # FIFO empty, let's go # do we need to wait? The write is going in the FIFO anyway...
                                   If(fmovem_mode[0], # dynamic
                                      NextValue(response, transfer_singlereg_primitive(CA=1,PC=0,DR=0,DA=0,Register=fmovem_reglist_regidx)),
                                      NextState("WaitForRegListReadResponse"),
                                   ).Else( # static
                                       NextValue(response, null_primitive(CA=1,IA=1)),
                                       NextValue(self.regselect, Cat(fmovem_reglist_static, Signal(8, reset = 0))),
                                       NextValue(regselect_buf, Cat(fmovem_reglist_static, Signal(8, reset = 0))), # working copy
                                       NextState("SetRequestResponse"),
                                   )
                                   #).Else(
                                   # NextValue(response, null_primitive(CA=1, IA=1)),
                                   # NextState("WaitCompute"),
                                   #)
                                ),
        )
        fpu_fmovem_tofp_fsm.act("WaitForRegListReadResponse",
                                If(response_re,
                                   NextValue(response, null_primitive(CA=1,IA=1)),
                                   NextState("WaitForRegListWriteOperand"),
                                ),
        )
        fpu_fmovem_tofp_fsm.act("WaitForRegListWriteOperand",
                                If(operand_we,
                                   NextValue(self.regselect, Cat(operand[0:8], Signal(8, reset = 0))),
                                   NextValue(regselect_buf, Cat(operand[0:8], Signal(8, reset = 0))), # working copy
                                   NextState("SetRequestResponse"),
                                ),
        )
        fpu_fmovem_tofp_fsm.act("SetRequestResponse",
                                #NextValue(response, (12 * sum8.output) | Signal(16, reset = transfer_multi_copro_regs_primitive(CA=1,PC=0,DR=0,Length=0))),
                                NextValue(response, transfer_multi_copro_regs_primitive(CA=1,PC=0,DR=0,Length=12)),
                                NextState("WaitForTransferRequestReadResponse"),
        )
        fpu_fmovem_tofp_fsm.act("WaitForTransferRequestReadResponse",
                                If(response_re,
                                   NextValue(op_cycle,2),
                                   NextValue(fmovem_reg_idx, (0x7 - ctz8.output)), # preserve # low-order bit is %fp7 here
                                   NextValue(regselect_buf, (regselect_buf & (regselect_buf - Signal(8, reset = 1)))),
                                   If(ctz8.valid,
                                      NextValue(response, null_primitive(CA=1,IA=1)),
                                      NextState("WaitForWordWrite"), # BTW, the CPU will read regselect first
                                   ).Else( # no register in list
                                       NextValue(response, null_primitive(PF=1)), # IDLE
                                       NextState("Idle"),
                                   )
                                ),
        )
        fpu_fmovem_tofp_fsm.act("WaitForWordWrite",
                                If(operand_we,
                                   NextValue(op_cycle, op_cycle - 1),
                                   NextValue(operands[op_cycle], operand),
                                   If(op_cycle == 0, # fixme: non-FP ?
                                      compute_fifo_din.regin.eq(0),
                                      compute_fifo_din.regout.eq(fmovem_reg_idx),
                                      compute_fifo_din.regormem.eq(1),
                                      compute_fifo_din.opcode.eq(0), # FMove
                                      compute_fifo.we.eq(1),
                                      compute_fifo_din.operand.eq(conv_79_81_out),
                                      If(ctz8.valid, # next value is valid so we need to keep going
                                         NextValue(op_cycle,2),
                                         NextValue(fmovem_reg_idx, (0x7 - ctz8.output)), # preserve
                                         NextValue(regselect_buf, (regselect_buf & (regselect_buf - Signal(8, reset = 1)))),
                                      ).Else( # finished
                                          NextValue(response, null_primitive(PF=1)), # IDLE
                                          NextState("Idle"),
                                      )
                                   ),
                                ),
        )


        self.submodules.fpu_fmovem_tomem_fsm = fpu_fmovem_tomem_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))
        fpu_fmovem_tomem_fsm.act("Reset",
                                 NextState("Idle"),
        )
        fpu_fmovem_tomem_fsm.act("Idle",
                                If(command_we & (opclass == 7), # 'b111
                                   NextValue(pre_or_post_reg, fmovem_mode[1]),
                                   If(~compute_fifo.readable, # FIFO empty, let's go
                                      If(fmovem_mode[0], # dynamic
                                         NextValue(response, transfer_singlereg_primitive(CA=1,PC=0,DR=0,DA=0,Register=fmovem_reglist_regidx)),
                                         NextState("WaitForRegListReadResponse"),
                                      ).Else( # static
                                          NextValue(response, null_primitive(CA=1,IA=1)),
                                          NextValue(self.regselect, Cat(fmovem_reglist_static, Signal(8, reset = 0))),
                                          NextValue(regselect_buf, Cat(fmovem_reglist_static, Signal(8, reset = 0))), # working copy
                                          NextState("DelayOneCycleToAccessRegister"),
                                      )
                                   ).Else(
                                       NextValue(response, null_primitive(CA=1, IA=1)),
                                       NextState("WaitCompute"),
                                   )
                                ),
        )
        fpu_fmovem_tomem_fsm.act("WaitCompute",
                                 If(~compute_fifo.readable, # FIFO empty, let's go
                                    If(fmovem_mode[0], # dynamic
                                       NextValue(response, transfer_singlereg_primitive(CA=1,PC=0,DR=0,DA=0,Register=fmovem_reglist_regidx)),
                                       NextState("WaitForRegListReadResponse"),
                                    ).Else( # static
                                        #NextValue(response, null_primitive(CA=1, IA=1)), #already set
                                        NextValue(self.regselect, Cat(fmovem_reglist_static, Signal(8, reset = 0))),
                                        NextValue(regselect_buf, Cat(fmovem_reglist_static, Signal(8, reset = 0))), # working copy
                                        NextState("DelayOneCycleToAccessRegister"),
                                    )
                                 )
        )
        fpu_fmovem_tomem_fsm.act("WaitForRegListReadResponse",
                                If(response_re,
                                   NextValue(response, null_primitive(CA=1,IA=1)),
                                   NextState("WaitForRegListWriteOperand"),
                                ),
        )
        fpu_fmovem_tomem_fsm.act("WaitForRegListWriteOperand",
                                If(operand_we,
                                   NextValue(self.regselect, Cat(operand[0:8], Signal(8, reset = 0))),
                                   NextValue(regselect_buf, Cat(operand[0:8], Signal(8, reset = 0))), # working copy
                                   NextState("DelayOneCycleToAccessRegister"),
                                ),
        )
        fpu_fmovem_tomem_fsm.act("DelayOneCycleToAccessRegister", # maybe not necessary ?
                                 # response must be set here, not in the next cycle, as otherwise it seems we see a response_re from the previous null response...
                                 # and then we replace the real response by a new null and the '030 never see the proper response
                                 # ... I think that's what happen anyway
                                 # might be solved by removing the one cycle delay in copro.py ? needed for _we but not _re ?
                                 #NextValue(response, (12 * sum8.output) | Signal(16, reset = transfer_multi_copro_regs_primitive(CA=1,PC=0,DR=1,Length=0))),
                                 NextValue(response, transfer_multi_copro_regs_primitive(CA=1,PC=0,DR=1,Length=12)),
                                 If(pre_or_post_reg,
                                    NextValue(conv_81_all_in, regs_fp[0x7 - ctz8.output]), ## mmm, the data will only be available next cycle...
                                 ).Else(
                                     NextValue(conv_81_all_in, regs_fp[ctz8.output])
                                 ),
                                 NextState("SetOperand"),
        )
        fpu_fmovem_tomem_fsm.act("SetOperand",
                                 #NextValue(response, (12 * sum8.output) | Signal(16, reset = transfer_multi_copro_regs_primitive(CA=1,PC=0,DR=1,Length=0))),
                                 NextValue(operand,     fp80_to_operand.raw_bits()[64:96]),
                                 NextValue(operands[2], fp80_to_operand.raw_bits()[32:64]),
                                 NextValue(operands[1], fp80_to_operand.raw_bits()[ 0:32]),
                                 NextState("WaitForTransferRequestWriteResponse"),
        )
        fpu_fmovem_tomem_fsm.act("WaitForTransferRequestWriteResponse",
                                If(response_re,
                                   NextValue(op_cycle,2),
                                   If(ctz8.valid,
                                      NextValue(response, null_primitive(CA=1,IA=1)),
                                      NextState("WaitForWordRead"), # BTW, the CPU will read regselect first
                                   ).Else( # no register in list
                                       NextValue(response, null_primitive(PF=1)), # IDLE
                                       NextState("Idle"),
                                   )
                                ),
        )
        fpu_fmovem_tomem_fsm.act("WaitForWordRead",
                                If(operand_re,
                                   NextValue(op_cycle, op_cycle - 1),
                                   NextValue(operand, operands[op_cycle]),
                                   If(op_cycle == 2, # can do it here, operand_re will only be valid 1 cycle
                                      NextValue(regselect_buf, (regselect_buf & (regselect_buf - Signal(8, reset = 1)))),
                                   ),
                                   If(op_cycle == 1,
                                      If(pre_or_post_reg,
                                         NextValue(conv_81_all_in, regs_fp[0x7 - ctz8.output]), ## mmm, the data will only be available next cycle...
                                      ).Else(
                                          NextValue(conv_81_all_in, regs_fp[ctz8.output])
                                      ),
                                   ),
                                   If(op_cycle == 0, # fixme: non-FP ?
                                      If(ctz8.valid, # next value is valid so we need to keep going
                                         NextValue(op_cycle,2),
                                         NextValue(operand,     fp80_to_operand.raw_bits()[64:96]),
                                         NextValue(operands[2], fp80_to_operand.raw_bits()[32:64]),
                                         NextValue(operands[1], fp80_to_operand.raw_bits()[ 0:32]),
                                      ).Else( # finished
                                          NextValue(response, null_primitive(PF=1)), # IDLE
                                          NextState("Idle"),
                                      )
                                   ),
                                ),
        )
        
        # **********************************************************************************
        ### Conditional FSM

        # **********************************************************************************
        ### Context Switch FSM
        

        # **********************************************************************************
        ### Compute FSM
        ## work buffers
        operand0 = Signal(81)
        operand1 = Signal(81)
        delay = Signal(8)

        ## pipelines output from the FloPoCo compute blocks
        # 0: Add (also sub)
        # 1: Mult
        # 2: Div
        # 3: Sqrt (disabled, too large)
        out_pipelines = Array(Signal(81) for x in range(3))
        pip_idx = Signal(3)

        self.submodules.fpu_compute_fsm = fpu_compute_fsm = ClockDomainsRenamer(cd_fpu)(FSM(reset_state="Reset"))
        fpu_compute_fsm.act("Reset",
                       NextValue(response, null_primitive(PF=1)), # IDLE
                       NextState("Idle"),
        )
        fpu_compute_fsm.act("Idle",
                       If(compute_fifo.readable,
                          If(compute_fifo_dout.regormem,
                             NextValue(operand0, compute_fifo_dout.operand),
                          ).Else(
                             NextValue(operand0, regs_fp[compute_fifo_dout.regin]),
                          ),
                          NextValue(operand1, regs_fp[compute_fifo_dout.regout]),
                          NextState("Compute"),
                       ),
        )
        fpu_compute_fsm.act("Compute",
                            Case(compute_fifo_dout.opcode, {
                                0x00: [ # FMove # no extra compute
                                    NextValue(regs_fp[compute_fifo_dout.regout], operand0),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                # 0x01: ! FInt 
                                # 0x02: ! FSinh
                                # 0x03: ! FIntrRZ
                                #0x04: [ # FSqrt
                                #    NextValue(delay, 8),
                                #    NextValue(pip_idx, 3),
                                #    NextState("Wait"),
                                #],
                                # 0x05: --
                                # 0x06: ! FLognP1
                                # 0x07: --
                                # 0x08: ! FEtoxM1 [exp]
                                # 0x09: ! FTanh
                                # 0x0A: ! FAtan
                                # 0x0B: --
                                # 0x0C: ! FAsin
                                # 0x0D: ! FAtanh
                                # 0x0E: ! FSin
                                # 0x0F: ! FTan
                                # 0x10: ! FEtox [exp]
                                # 0x11: ! FTwotox
                                # 0x12: ! FTentox
                                # 0x13: --
                                # 0x14: ! FLogn
                                # 0x15: ! FLog10
                                # 0x16: ! FLog2
                                # 0x17: --
                                0x18: [ # FAbs
                                    NextValue(regs_fp[compute_fifo_dout.regout], operand0 & ~(1 << 78)),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                # 0x19: ! FCosh
                                0x1A: [ # FNeg
                                    NextValue(regs_fp[compute_fifo_dout.regout], operand0 ^ (1 << 78)),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                # 0x1B: --
                                # 0x1C: ! FAcos
                                # 0x1D: ! FCos
                                # 0x1E: ! FGetExp
                                # 0x1F: ! FGetMan
                                0x20: [ # FDiv
                                    NextValue(delay, 7),
                                    NextValue(pip_idx, 2),
                                    NextState("Wait"),
                                ],
                                # 0x21: ! FMod
                                0x22: [ # FAdd
                                    NextValue(delay, 1), # pipeline latency - 1
                                    NextValue(pip_idx, 0),
                                    NextState("Wait"),
                                ],
                                0x23: [ # FMul
                                    NextValue(delay, 2),
                                    NextValue(pip_idx, 1),
                                    NextState("Wait"),
                                ],
                                # 0x24: ! FSglDiv
                                # 0x25: ! FRem
                                # 0x26: ! FScale
                                # 0x27: ! FSglMul
                                0x28: [ # FSub
                                    NextValue(operand0, operand0 ^ (1 << 78)), # invert sign bit
                                    NextValue(delay, 2), # we're updating the operand, so one more cycle
                                    NextValue(pip_idx, 0),
                                    NextState("Wait"),
                                ],
                                # 0x29: --
                                # 0x30 - 0x37 (!): ! FSinCos
                                # 0x38: FCmp
                                # 0x39: --
                                # 0x3A: FTst
                                # 0x3B - 0x3F: --
                                # 0x40 - 0x7F: undefined
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
                               NextValue(regs_fp[compute_fifo_dout.regout], out_pipelines[pip_idx]),
                               compute_fifo.re.eq(1),
                               NextState("Idle"),
                            ),
        )


        # **********************************************************************************
        ### FloPoCo blocks
        ## conversion
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
        
        self.specials += Instance("OutputIEEE_15_63_to_15_63_comb_uid2",
                                  i_X = conv_81_all_in,
                                  o_R = conv_81_79_out,)
        platform.add_source("OutputIEEE_15_63_to_15_63_comb_uid2.vhdl", "vhdl")
        
        self.specials += Instance("OutputIEEE_15_63_to_11_52_comb_uid2",
                                  i_X = conv_81_all_in,
                                  o_R = conv_81_64_out,)
        platform.add_source("OutputIEEE_15_63_to_11_52_comb_uid2.vhdl", "vhdl")
        
        self.specials += Instance("OutputIEEE_15_63_to_8_23_comb_uid2",
                                  i_X = conv_81_all_in,
                                  o_R = conv_81_32_out,)
        platform.add_source("OutputIEEE_15_63_to_8_23_comb_uid2.vhdl", "vhdl")

        ## compute
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

        self.specials += Instance("FPDiv_15_63_Freq100_uid2",
                                  i_clk = ClockSignal(cd_fpu),
                                  i_X = operand1, # backward
                                  i_Y = operand0,
                                  o_R = out_pipelines[2],)
        platform.add_source("FPDiv_15_63_Freq100_uid2.vhdl", "vhdl")

        #self.specials += Instance("FPSqrt_15_63",
        #                          i_clk = ClockSignal(cd_fpu),
        #                          i_X = operand0,
        #                          o_R = out_pipelines[3],)
        #platform.add_source("FPSqrt_15_63_Freq100.vhdl", "vhdl")

        ############ const table
        self.comb += [
            ## native Motorola FP80
            #const_table[0x00].eq(0x4000c90fdaa22168c235), # Pi      
            #const_table[0x0b].eq(0x3ffd9a209a84fbcff798), # Log10(2)
            #const_table[0x0c].eq(0x4000adf85458a2bb4a9a), # e       
            #const_table[0x0d].eq(0x3fffb8aa3b295c17f0bc), # Log2(e) 
            #const_table[0x0e].eq(0x3ffdde5bd8a937287195), # Log10(e)
            #const_table[0x0f].eq(0x00000000000000000000), # Zero    
            #const_table[0x30].eq(0x3ffeb17217f7d1cf79ac), # ln(2)   
            #const_table[0x31].eq(0x4000935d8dddaaa8ac17), # ln(10)  
            #const_table[0x32].eq(0x3fff8000000000000000), # 10^0    
            #const_table[0x33].eq(0x4002a000000000000000), # 10^1    
            #const_table[0x34].eq(0x4005c800000000000000), # 10^2    
            #const_table[0x35].eq(0x400c9c40000000000000), # 10^4    
            #const_table[0x36].eq(0x4019bebc200000000000), # 10^8    
            #const_table[0x37].eq(0x40348e1bc9bf04000000), # 10^16   
            #const_table[0x38].eq(0x40699dc5ada82b70b59e), # 10^32   
            #const_table[0x39].eq(0x40d3c2781f49ffcfa6d5), # 10^64   
            #const_table[0x3a].eq(0x41a893ba47c980e98ce0), # 10^128  
            #const_table[0x3b].eq(0x4351aa7eebfb9df9de8e), # 10^256  
            #const_table[0x3c].eq(0x46a3e319a0aea60e91c7), # 10^512  
            #const_table[0x3d].eq(0x4d48c976758681750c17), # 10^1024 
            #const_table[0x3e].eq(0x5a929e8b3b5dc53d5de5), # 10^2048 
            #const_table[0x3f].eq(0x7525c46052028a20979b), # 10^4096
            ## converted to FloPoCo (expect high order bit #80, which is always 0)
            const_table[0x00].eq(0xa000490fdaa22168c235),
            const_table[0x0b].eq(0x9ffe9a209a84fbcff798),
            const_table[0x0c].eq(0xa0002df85458a2bb4a9a),
            const_table[0x0d].eq(0x9fffb8aa3b295c17f0bc),
            const_table[0x0e].eq(0x9ffede5bd8a937287195),
            const_table[0x0f].eq(0x00000000000000000000),
            const_table[0x30].eq(0x9fff317217f7d1cf79ac),
            const_table[0x31].eq(0xa000135d8dddaaa8ac17),
            const_table[0x32].eq(0x9fff8000000000000000),
            const_table[0x33].eq(0xa0012000000000000000),
            const_table[0x34].eq(0xa002c800000000000000),
            const_table[0x35].eq(0xa0061c40000000000000),
            const_table[0x36].eq(0xa00cbebc200000000000),
            const_table[0x37].eq(0xa01a0e1bc9bf04000000),
            const_table[0x38].eq(0xa0349dc5ada82b70b59e),
            const_table[0x39].eq(0xa069c2781f49ffcfa6d5),
            const_table[0x3a].eq(0xa0d413ba47c980e98ce0),
            const_table[0x3b].eq(0xa1a8aa7eebfb9df9de8e),
            const_table[0x3c].eq(0xa351e319a0aea60e91c7),
            const_table[0x3d].eq(0xa6a44976758681750c17),
            const_table[0x3e].eq(0xad491e8b3b5dc53d5de5),
            const_table[0x3f].eq(0xba92c46052028a20979b),
        ]

        led0 = platform.request("user_led", 0)
        led1 = platform.request("user_led", 1)
        led2 = platform.request("user_led", 2)
        led3 = platform.request("user_led", 3)
        led4 = platform.request("user_led", 4)
        led5 = platform.request("user_led", 5)
        led6 = platform.request("user_led", 6)
        led7 = platform.request("user_led", 7)

        
        self.comb += [
            #led0.eq(~fpu_compute_fsm.ongoing("Idle")),
            #led1.eq(~fpu_fptofp_fsm.ongoing("Idle")),
            #led2.eq(~fpu_fptomem_fsm.ongoing("Idle")),

            #led0.eq(~fpu_fptomem_fsm.ongoing("Idle")),
            #led1.eq(~fpu_compute_fsm.ongoing("Idle") | ~fpu_fptofp_fsm.ongoing("Idle") | ~fpu_memtofp_fsm.ongoing("Idle")),
            #led2.eq(0),
            #led3.eq( fpu_fptomem_fsm.ongoing("WaitCompute")),
            #led4.eq( fpu_fptomem_fsm.ongoing("SetupData")),
            #led5.eq( fpu_fptomem_fsm.ongoing("StartData")),
            #led6.eq( fpu_fptomem_fsm.ongoing("WaitReadResponse1")),
            #led7.eq( fpu_fptomem_fsm.ongoing("WaitData")),
            
            led0.eq(~fpu_fptomem_fsm.ongoing("Idle") | ~fpu_compute_fsm.ongoing("Idle") | ~fpu_fptofp_fsm.ongoing("Idle") | ~fpu_memtofp_fsm.ongoing("Idle")),
            led1.eq(~fpu_fmovem_tomem_fsm.ongoing("Idle")),
            led2.eq( fpu_fmovem_tomem_fsm.ongoing("WaitForRegListReadResponse")),
            led3.eq( fpu_fmovem_tomem_fsm.ongoing("WaitForRegListWriteOperand")),
            led4.eq( fpu_fmovem_tomem_fsm.ongoing("DelayOneCycleToAccessRegister")),
            led5.eq( fpu_fmovem_tomem_fsm.ongoing("SetRequestResponse")),
            led6.eq( fpu_fmovem_tomem_fsm.ongoing("WaitForTransferRequestWriteResponse")),
            led7.eq( fpu_fmovem_tomem_fsm.ongoing("WaitForWordRead")),

            #led0.eq(regselect_buf[0]),
            #led1.eq(regselect_buf[1]),
            #led2.eq(regselect_buf[2]),
            #led3.eq(regselect_buf[3]),
            #led4.eq(regselect_buf[4]),
            #led5.eq(regselect_buf[5]),
            #led6.eq(regselect_buf[6]),
            #led7.eq(regselect_buf[7]),
        ]
