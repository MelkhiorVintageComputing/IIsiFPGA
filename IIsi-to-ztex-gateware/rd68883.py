from migen import *
from migen.genlib.fifo import *

from copro import *

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
        regs_fpcr = Signal(32)
        regs_fpsr = Signal(32)
        regs_fpiar = Signal(32)

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
        conv_32_81_in = Signal(64)
        conv_32_81_out = Signal(81)
        conv_64_81_in = Signal(64)
        conv_64_81_out = Signal(81)
        conv_79_81_in = Signal(79)
        conv_79_81_out = Signal(81)
        ## signals to 'out' blocks (to IEEE types)
        conv_81_all_in = Signal(81)
        conv_81_79_out = Signal(79)

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
        fp80_layout = [
            ( "mantissa", 63),
            ( "leading1", 1),
            ( "zero", 16),
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
            fp80_to_operand.leading1.eq(1), # CHECKME # FIXME
            fp80_to_operand.mantissa.eq(fp79_to_operand.mantissa),
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
        self.submodules.compute_fifo = compute_fifo = ClockDomainsRenamer(cd_fpu)(SyncFIFOBuffered(width=layout_len(internal_command_layout), depth=4))
        compute_fifo_din = Record(internal_command_layout)
        compute_fifo_dout = Record(internal_command_layout)
        self.comb += [
            compute_fifo_dout.raw_bits().eq(compute_fifo.dout),
            compute_fifo.din.eq(compute_fifo_din.raw_bits()),
        ]

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
                                  compute_fifo_din.operand.eq(Cat(const_table[extension[0:6]][0:63], const_table[extension[0:6]][64:80], Signal(2, reset = 0x1))),
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
                          NextValue(response, null_primitive(CA = 1, IA = 1)),
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
        fpu_fptomem_fsm.act("SetupData",
                            Case(data_type, {
                                0x1: [
                                    # FIXME FP32
                                    NextValue(op_cycle,0),
                                ],
                                0x2: [
                                    #NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=12)),
                                    #fp79_to_operand.eq(conv_81_79_out),
                                    #NextValue(operand,     fp80_to_operand.raw_bits()[64:96]),
                                    #NextValue(operands[2], fp80_to_operand.raw_bits()[32:64]),
                                    #NextValue(operands[1], fp80_to_operand.raw_bits()[ 0:32]),
                                    NextValue(fp79_to_operand.raw_bits(), conv_81_79_out),
                                    NextValue(op_cycle,2),
                                ],
                                0x5: [
                                    # FIXME FP64
                                    NextValue(op_cycle,1),
                                ],
                            }),
                            #NextState("WaitReadResponse1"),
                            NextState("StartData"),
                            # FIXME: illegal stuff
        )
        fpu_fptomem_fsm.act("StartData",
                            Case(data_type, {
                                0x1: [
                                    # FIXME FP32
                                ],
                                0x2: [
                                    NextValue(response, ea_transfer_primitive(CA=0,PC=0,DR=1,Valid=Valid_Memory_Alterable,Length=12)),
                                    NextValue(operand,     fp80_to_operand.raw_bits()[64:96]),
                                    NextValue(operands[2], fp80_to_operand.raw_bits()[32:64]),
                                    NextValue(operands[1], fp80_to_operand.raw_bits()[ 0:32]),
                                ],
                                0x5: [
                                    # FIXME FP64
                                ],
                            }),
                            NextState("WaitReadResponse1"),
        )
        fpu_fptomem_fsm.act("WaitReadResponse1",
                       If(response_re,
                          NextValue(response, null_primitive(CA=0,IA=1)), # ongoing
                          NextState("WaitData"),
                       ),
                       # FIXME: illegal stuff
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

        # **********************************************************************************
        ### Confitional FSM

        # **********************************************************************************
        ### Context Switch FSM
        

        # **********************************************************************************
        ### Compute FSM
        ## work buffers
        operand0 = Signal(81)
        operand1 = Signal(81)
        delay = Signal(8)

        ## pipelines output frol the FloPoCo compute blocks
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
                                # no extra compute
                                0x00: [ # FMove
                                    NextValue(regs_fp[compute_fifo_dout.regout], operand0),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                0x18: [ # FAbs
                                    NextValue(regs_fp[compute_fifo_dout.regout], operand0 & ~(1 << 78)),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                0x1A: [ # FNeg
                                    NextValue(regs_fp[compute_fifo_dout.regout], operand0 ^ (1 << 78)),
                                    compute_fifo.re.eq(1),
                                    NextState("Idle"),
                                ],
                                # dedicated compute pipelines
                                0x20: [ # FDiv
                                    NextValue(delay, 7),
                                    NextValue(pip_idx, 2),
                                    NextState("Wait"),
                                ],
                                0x22: [ # FAdd
                                    NextValue(delay, 1), # pipeline latency - 1, is that OK ?
                                    NextValue(pip_idx, 0),
                                    NextState("Wait"),
                                ],
                                0x23: [ # FMul
                                    NextValue(delay, 1),
                                    NextValue(pip_idx, 1),
                                    NextState("Wait"),
                                ],
                                0x28: [ # FSub
                                    NextValue(operand0, operand0 ^ (1 << 78)), # invert sign bit
                                    NextValue(delay, 2), # we're updating the operand, so one more cycle
                                    NextValue(pip_idx, 0),
                                    NextState("Wait"),
                                ],
                                # TBD
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


        ############ sonst table
        self.comb += [
            const_table[0x00].eq(0x4000c90fdaa22168c235), # Pi      
            const_table[0x0b].eq(0x3ffd9a209a84fbcff798), # Log10(2)
            const_table[0x0c].eq(0x4000adf85458a2bb4a9a), # e       
            const_table[0x0d].eq(0x3fffb8aa3b295c17f0bc), # Log2(e) 
            const_table[0x0e].eq(0x3ffdde5bd8a937287195), # Log10(e)
            const_table[0x0f].eq(0x00000000000000000000), # Zero    
            const_table[0x30].eq(0x3ffeb17217f7d1cf79ac), # ln(2)   
            const_table[0x31].eq(0x4000935d8dddaaa8ac17), # ln(10)  
            const_table[0x32].eq(0x3fff8000000000000000), # 10^0    
            const_table[0x33].eq(0x4002a000000000000000), # 10^1    
            const_table[0x34].eq(0x4005c800000000000000), # 10^2    
            const_table[0x35].eq(0x400c9c40000000000000), # 10^4    
            const_table[0x36].eq(0x4019bebc200000000000), # 10^8    
            const_table[0x37].eq(0x40348e1bc9bf04000000), # 10^16   
            const_table[0x38].eq(0x40699dc5ada82b70b59e), # 10^32   
            const_table[0x39].eq(0x40d3c2781f49ffcfa6d5), # 10^64   
            const_table[0x3a].eq(0x41a893ba47c980e98ce0), # 10^128  
            const_table[0x3b].eq(0x4351aa7eebfb9df9de8e), # 10^256  
            const_table[0x3c].eq(0x46a3e319a0aea60e91c7), # 10^512  
            const_table[0x3d].eq(0x4d48c976758681750c17), # 10^1024 
            const_table[0x3e].eq(0x5a929e8b3b5dc53d5de5), # 10^2048 
            const_table[0x3f].eq(0x7525c46052028a20979b), # 10^4096 
        ]
