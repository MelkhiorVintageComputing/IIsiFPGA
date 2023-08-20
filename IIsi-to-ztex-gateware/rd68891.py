from migen import *
from migen.genlib.fifo import *

from copro import *

class rd68891(Copro):
    def __init__(self, cd_krypto = "cpu"):
        
        super().__init__(cd_copro = cd_krypto)
    
        RESP_IDLE = null_primitive(PF = 1)
        RESP_ONGOING = null_primitive(CA = 1, IA = 1)
        RESP_EA_TRANSFER = ea_transfer_primitive(CA = 1, Valid = 6, Length = 16)
        RESP_SEND_REG = transfer_singlereg_primitive(CA = 1)
        RESP_RECV_REG = transfer_singlereg_primitive(DR = 1)

        krypto_sync = getattr(self.sync, cd_krypto)
        
        response  = self.response
        command   = self.command
        operand   = self.operand
        
        response_re = self.response_re
        command_we  = self.command_we
        operand_re  = self.operand_re
        operand_we  = self.operand_we
        
        ####
        
        encdec = Signal(1)
        alllast = Signal(1)
        regnum = Signal(3)
        operand_idx = Signal(2)
        rs2 = Array(Signal(32) for x in range(0, 4))
        rs1 = Signal(32)
        rs2_idx = Signal(2)
        
        aes_in = Array(Signal(8) for a in range(0, 4))
        aes_out = Array(Signal(24) for a in range(0, 4))

        self.submodules.krypto_fsm = krypto_fsm = ClockDomainsRenamer(cd_krypto)(FSM(reset_state="Reset"))

        krypto_fsm.act("Reset",
                       NextValue(response, RESP_IDLE),
                       NextState("Idle"),
        )
        krypto_fsm.act("Idle",
                       If(command_we,
                          NextValue(encdec, command[15]),
                          NextValue(alllast, command[14]),
                          NextValue(rs2_idx, command[12:14]),
                          NextValue(regnum, command[0:3]),
                          If(command[11], # SKIP
                             NextValue(response, RESP_SEND_REG | command[0:3]),
                             NextState("WaitReadResponse2"),
                          ).Else(
                              NextValue(response, RESP_EA_TRANSFER),
                              NextState("WaitReadResponse1"),
                          ),
                       ),
        )
        krypto_fsm.act("WaitReadResponse1",
                       If(response_re,
                          NextValue(response, RESP_SEND_REG | regnum),
                          NextValue(operand_idx, 0),
                          NextState("GetData"),
                       ),
                       # FIXME: illegal stuff
        )
        krypto_fsm.act("GetData",
                       If(operand_we,
                          NextValue(operand_idx, operand_idx + 1),
                          NextValue(rs2[operand_idx], operand),
                          If((operand_idx == 0x3),
                             NextState("WaitReadResponse2"),
                          ),
                       ),
                       # FIXME: illegal stuff
        )
        krypto_fsm.act("WaitReadResponse2",
                       If(response_re,
                          NextValue(response, RESP_ONGOING),
                          NextState("GetReg"),
                       ),
                       # FIXME: illegal stuff
        )
        krypto_fsm.act("GetReg",
                       If(operand_we,
                          NextValue(rs1, operand),
                          aes_in[0].eq(rs2[(rs2_idx+0)[0:2]][24:32]),
                          aes_in[1].eq(rs2[(rs2_idx+1)[0:2]][16:24]),
                          aes_in[2].eq(rs2[(rs2_idx+2)[0:2]][ 8:16]),
                          aes_in[3].eq(rs2[(rs2_idx+3)[0:2]][ 0: 8]),
                          NextState("Compute"), # FIXME everywhere: encode vs. decode
                       ),
                       # FIXME: illegal stuff
        )
        
        pattern0 = Signal(32)
        pattern1 = Signal(32)
        pattern2 = Signal(32)
        pattern3 = Signal(32)

        self.comb += If(~alllast,
                        pattern0.eq(Cat(aes_out[0][16:24], aes_out[0][ 8:16], aes_out[0][ 8:16], aes_out[0][ 0: 8])),
                     ).Else(
                        pattern0.eq(Cat(Signal(24, reset = 0), aes_out[0][8:16])),
                     )
        
        self.comb += If(~alllast,
                        pattern1.eq(Cat(aes_out[1][ 8:16], aes_out[1][ 8:16], aes_out[1][ 0: 8], aes_out[1][16:24])),
                     ).Else(
                            pattern1.eq(Cat(Signal(16, reset = 0), aes_out[1][8:16], Signal(8, reset = 0))),
                     )
        
        self.comb += If(~alllast,
                        pattern2.eq(Cat(aes_out[2][ 8:16], aes_out[2][ 0: 8], aes_out[2][16:24], aes_out[2][ 8:16])),
                     ).Else(
                            pattern2.eq(Cat(Signal(8, reset = 0), aes_out[2][8:16], Signal(16, reset = 0))),
                     )
        
        self.comb += If(~alllast,
                        pattern3.eq(Cat(aes_out[3][ 0: 8], aes_out[3][16:24], aes_out[3][ 8:16], aes_out[3][ 8:16])),
                     ).Else(
                            pattern3.eq(Cat(aes_out[3][8:16], Signal(24, reset = 0))),
                     )
        
        krypto_fsm.act("Compute",
                       NextValue(operand, rs1 ^ pattern0 ^ pattern1 ^ pattern2 ^ pattern3),
                       NextValue(response, RESP_RECV_REG | regnum),
                       NextState("WaitReadOperand"),
                       # FIXME: illegal stuff
        )
                            
        krypto_fsm.act("WaitReadOperand",
                       If(operand_re,
                            NextValue(response, RESP_IDLE),
                            NextState("Idle"),
                       ),
                       # FIXME: illegal stuff
        )

        for i in range(4):
            krypto_sync += Case(aes_in[i], { 0x00: aes_out[i].eq(0xa563c6), 0x01: aes_out[i].eq(0x847cf8), 0x02: aes_out[i].eq(0x9977ee), 0x03: aes_out[i].eq(0x8d7bf6), 0x04: aes_out[i].eq(0x0df2ff), 0x05: aes_out[i].eq(0xbd6bd6), 0x06: aes_out[i].eq(0xb16fde), 0x07: aes_out[i].eq(0x54c591), 0x08: aes_out[i].eq(0x503060), 0x09: aes_out[i].eq(0x030102), 0x0a: aes_out[i].eq(0xa967ce), 0x0b: aes_out[i].eq(0x7d2b56), 0x0c: aes_out[i].eq(0x19fee7), 0x0d: aes_out[i].eq(0x62d7b5), 0x0e: aes_out[i].eq(0xe6ab4d), 0x0f: aes_out[i].eq(0x9a76ec), 0x10: aes_out[i].eq(0x45ca8f), 0x11: aes_out[i].eq(0x9d821f), 0x12: aes_out[i].eq(0x40c989), 0x13: aes_out[i].eq(0x877dfa), 0x14: aes_out[i].eq(0x15faef), 0x15: aes_out[i].eq(0xeb59b2), 0x16: aes_out[i].eq(0xc9478e), 0x17: aes_out[i].eq(0x0bf0fb), 0x18: aes_out[i].eq(0xecad41), 0x19: aes_out[i].eq(0x67d4b3), 0x1a: aes_out[i].eq(0xfda25f), 0x1b: aes_out[i].eq(0xeaaf45), 0x1c: aes_out[i].eq(0xbf9c23), 0x1d: aes_out[i].eq(0xf7a453), 0x1e: aes_out[i].eq(0x9672e4), 0x1f: aes_out[i].eq(0x5bc09b), 0x20: aes_out[i].eq(0xc2b775), 0x21: aes_out[i].eq(0x1cfde1), 0x22: aes_out[i].eq(0xae933d), 0x23: aes_out[i].eq(0x6a264c), 0x24: aes_out[i].eq(0x5a366c), 0x25: aes_out[i].eq(0x413f7e), 0x26: aes_out[i].eq(0x02f7f5), 0x27: aes_out[i].eq(0x4fcc83), 0x28: aes_out[i].eq(0x5c3468), 0x29: aes_out[i].eq(0xf4a551), 0x2a: aes_out[i].eq(0x34e5d1), 0x2b: aes_out[i].eq(0x08f1f9), 0x2c: aes_out[i].eq(0x9371e2), 0x2d: aes_out[i].eq(0x73d8ab), 0x2e: aes_out[i].eq(0x533162), 0x2f: aes_out[i].eq(0x3f152a), 0x30: aes_out[i].eq(0x0c0408), 0x31: aes_out[i].eq(0x52c795), 0x32: aes_out[i].eq(0x652346), 0x33: aes_out[i].eq(0x5ec39d), 0x34: aes_out[i].eq(0x281830), 0x35: aes_out[i].eq(0xa19637), 0x36: aes_out[i].eq(0x0f050a), 0x37: aes_out[i].eq(0xb59a2f), 0x38: aes_out[i].eq(0x09070e), 0x39: aes_out[i].eq(0x361224), 0x3a: aes_out[i].eq(0x9b801b), 0x3b: aes_out[i].eq(0x3de2df), 0x3c: aes_out[i].eq(0x26ebcd), 0x3d: aes_out[i].eq(0x69274e), 0x3e: aes_out[i].eq(0xcdb27f), 0x3f: aes_out[i].eq(0x9f75ea), 0x40: aes_out[i].eq(0x1b0912), 0x41: aes_out[i].eq(0x9e831d), 0x42: aes_out[i].eq(0x742c58), 0x43: aes_out[i].eq(0x2e1a34), 0x44: aes_out[i].eq(0x2d1b36), 0x45: aes_out[i].eq(0xb26edc), 0x46: aes_out[i].eq(0xee5ab4), 0x47: aes_out[i].eq(0xfba05b), 0x48: aes_out[i].eq(0xf652a4), 0x49: aes_out[i].eq(0x4d3b76), 0x4a: aes_out[i].eq(0x61d6b7), 0x4b: aes_out[i].eq(0xceb37d), 0x4c: aes_out[i].eq(0x7b2952), 0x4d: aes_out[i].eq(0x3ee3dd), 0x4e: aes_out[i].eq(0x712f5e), 0x4f: aes_out[i].eq(0x978413), 0x50: aes_out[i].eq(0xf553a6), 0x51: aes_out[i].eq(0x68d1b9), 0x52: aes_out[i].eq(0x000000), 0x53: aes_out[i].eq(0x2cedc1), 0x54: aes_out[i].eq(0x602040), 0x55: aes_out[i].eq(0x1ffce3), 0x56: aes_out[i].eq(0xc8b179), 0x57: aes_out[i].eq(0xed5bb6), 0x58: aes_out[i].eq(0xbe6ad4), 0x59: aes_out[i].eq(0x46cb8d), 0x5a: aes_out[i].eq(0xd9be67), 0x5b: aes_out[i].eq(0x4b3972), 0x5c: aes_out[i].eq(0xde4a94), 0x5d: aes_out[i].eq(0xd44c98), 0x5e: aes_out[i].eq(0xe858b0), 0x5f: aes_out[i].eq(0x4acf85), 0x60: aes_out[i].eq(0x6bd0bb), 0x61: aes_out[i].eq(0x2aefc5), 0x62: aes_out[i].eq(0xe5aa4f), 0x63: aes_out[i].eq(0x16fbed), 0x64: aes_out[i].eq(0xc54386), 0x65: aes_out[i].eq(0xd74d9a), 0x66: aes_out[i].eq(0x553366), 0x67: aes_out[i].eq(0x948511), 0x68: aes_out[i].eq(0xcf458a), 0x69: aes_out[i].eq(0x10f9e9), 0x6a: aes_out[i].eq(0x060204), 0x6b: aes_out[i].eq(0x817ffe), 0x6c: aes_out[i].eq(0xf050a0), 0x6d: aes_out[i].eq(0x443c78), 0x6e: aes_out[i].eq(0xba9f25), 0x6f: aes_out[i].eq(0xe3a84b), 0x70: aes_out[i].eq(0xf351a2), 0x71: aes_out[i].eq(0xfea35d), 0x72: aes_out[i].eq(0xc04080), 0x73: aes_out[i].eq(0x8a8f05), 0x74: aes_out[i].eq(0xad923f), 0x75: aes_out[i].eq(0xbc9d21), 0x76: aes_out[i].eq(0x483870), 0x77: aes_out[i].eq(0x04f5f1), 0x78: aes_out[i].eq(0xdfbc63), 0x79: aes_out[i].eq(0xc1b677), 0x7a: aes_out[i].eq(0x75daaf), 0x7b: aes_out[i].eq(0x632142), 0x7c: aes_out[i].eq(0x301020), 0x7d: aes_out[i].eq(0x1affe5), 0x7e: aes_out[i].eq(0x0ef3fd), 0x7f: aes_out[i].eq(0x6dd2bf), 0x80: aes_out[i].eq(0x4ccd81), 0x81: aes_out[i].eq(0x140c18), 0x82: aes_out[i].eq(0x351326), 0x83: aes_out[i].eq(0x2fecc3), 0x84: aes_out[i].eq(0xe15fbe), 0x85: aes_out[i].eq(0xa29735), 0x86: aes_out[i].eq(0xcc4488), 0x87: aes_out[i].eq(0x39172e), 0x88: aes_out[i].eq(0x57c493), 0x89: aes_out[i].eq(0xf2a755), 0x8a: aes_out[i].eq(0x827efc), 0x8b: aes_out[i].eq(0x473d7a), 0x8c: aes_out[i].eq(0xac64c8), 0x8d: aes_out[i].eq(0xe75dba), 0x8e: aes_out[i].eq(0x2b1932), 0x8f: aes_out[i].eq(0x9573e6), 0x90: aes_out[i].eq(0xa060c0), 0x91: aes_out[i].eq(0x988119), 0x92: aes_out[i].eq(0xd14f9e), 0x93: aes_out[i].eq(0x7fdca3), 0x94: aes_out[i].eq(0x662244), 0x95: aes_out[i].eq(0x7e2a54), 0x96: aes_out[i].eq(0xab903b), 0x97: aes_out[i].eq(0x83880b), 0x98: aes_out[i].eq(0xca468c), 0x99: aes_out[i].eq(0x29eec7), 0x9a: aes_out[i].eq(0xd3b86b), 0x9b: aes_out[i].eq(0x3c1428), 0x9c: aes_out[i].eq(0x79dea7), 0x9d: aes_out[i].eq(0xe25ebc), 0x9e: aes_out[i].eq(0x1d0b16), 0x9f: aes_out[i].eq(0x76dbad), 0xa0: aes_out[i].eq(0x3be0db), 0xa1: aes_out[i].eq(0x563264), 0xa2: aes_out[i].eq(0x4e3a74), 0xa3: aes_out[i].eq(0x1e0a14), 0xa4: aes_out[i].eq(0xdb4992), 0xa5: aes_out[i].eq(0x0a060c), 0xa6: aes_out[i].eq(0x6c2448), 0xa7: aes_out[i].eq(0xe45cb8), 0xa8: aes_out[i].eq(0x5dc29f), 0xa9: aes_out[i].eq(0x6ed3bd), 0xaa: aes_out[i].eq(0xefac43), 0xab: aes_out[i].eq(0xa662c4), 0xac: aes_out[i].eq(0xa89139), 0xad: aes_out[i].eq(0xa49531), 0xae: aes_out[i].eq(0x37e4d3), 0xaf: aes_out[i].eq(0x8b79f2), 0xb0: aes_out[i].eq(0x32e7d5), 0xb1: aes_out[i].eq(0x43c88b), 0xb2: aes_out[i].eq(0x59376e), 0xb3: aes_out[i].eq(0xb76dda), 0xb4: aes_out[i].eq(0x8c8d01), 0xb5: aes_out[i].eq(0x64d5b1), 0xb6: aes_out[i].eq(0xd24e9c), 0xb7: aes_out[i].eq(0xe0a949), 0xb8: aes_out[i].eq(0xb46cd8), 0xb9: aes_out[i].eq(0xfa56ac), 0xba: aes_out[i].eq(0x07f4f3), 0xbb: aes_out[i].eq(0x25eacf), 0xbc: aes_out[i].eq(0xaf65ca), 0xbd: aes_out[i].eq(0x8e7af4), 0xbe: aes_out[i].eq(0xe9ae47), 0xbf: aes_out[i].eq(0x180810), 0xc0: aes_out[i].eq(0xd5ba6f), 0xc1: aes_out[i].eq(0x8878f0), 0xc2: aes_out[i].eq(0x6f254a), 0xc3: aes_out[i].eq(0x722e5c), 0xc4: aes_out[i].eq(0x241c38), 0xc5: aes_out[i].eq(0xf1a657), 0xc6: aes_out[i].eq(0xc7b473), 0xc7: aes_out[i].eq(0x51c697), 0xc8: aes_out[i].eq(0x23e8cb), 0xc9: aes_out[i].eq(0x7cdda1), 0xca: aes_out[i].eq(0x9c74e8), 0xcb: aes_out[i].eq(0x211f3e), 0xcc: aes_out[i].eq(0xdd4b96), 0xcd: aes_out[i].eq(0xdcbd61), 0xce: aes_out[i].eq(0x868b0d), 0xcf: aes_out[i].eq(0x858a0f), 0xd0: aes_out[i].eq(0x9070e0), 0xd1: aes_out[i].eq(0x423e7c), 0xd2: aes_out[i].eq(0xc4b571), 0xd3: aes_out[i].eq(0xaa66cc), 0xd4: aes_out[i].eq(0xd84890), 0xd5: aes_out[i].eq(0x050306), 0xd6: aes_out[i].eq(0x01f6f7), 0xd7: aes_out[i].eq(0x120e1c), 0xd8: aes_out[i].eq(0xa361c2), 0xd9: aes_out[i].eq(0x5f356a), 0xda: aes_out[i].eq(0xf957ae), 0xdb: aes_out[i].eq(0xd0b969), 0xdc: aes_out[i].eq(0x918617), 0xdd: aes_out[i].eq(0x58c199), 0xde: aes_out[i].eq(0x271d3a), 0xdf: aes_out[i].eq(0xb99e27), 0xe0: aes_out[i].eq(0x38e1d9), 0xe1: aes_out[i].eq(0x13f8eb), 0xe2: aes_out[i].eq(0xb3982b), 0xe3: aes_out[i].eq(0x331122), 0xe4: aes_out[i].eq(0xbb69d2), 0xe5: aes_out[i].eq(0x70d9a9), 0xe6: aes_out[i].eq(0x898e07), 0xe7: aes_out[i].eq(0xa79433), 0xe8: aes_out[i].eq(0xb69b2d), 0xe9: aes_out[i].eq(0x221e3c), 0xea: aes_out[i].eq(0x928715), 0xeb: aes_out[i].eq(0x20e9c9), 0xec: aes_out[i].eq(0x49ce87), 0xed: aes_out[i].eq(0xff55aa), 0xee: aes_out[i].eq(0x782850), 0xef: aes_out[i].eq(0x7adfa5), 0xf0: aes_out[i].eq(0x8f8c03), 0xf1: aes_out[i].eq(0xf8a159), 0xf2: aes_out[i].eq(0x808909), 0xf3: aes_out[i].eq(0x170d1a), 0xf4: aes_out[i].eq(0xdabf65), 0xf5: aes_out[i].eq(0x31e6d7), 0xf6: aes_out[i].eq(0xc64284), 0xf7: aes_out[i].eq(0xb868d0), 0xf8: aes_out[i].eq(0xc34182), 0xf9: aes_out[i].eq(0xb09929), 0xfa: aes_out[i].eq(0x772d5a), 0xfb: aes_out[i].eq(0x110f1e), 0xfc: aes_out[i].eq(0xcbb07b), 0xfd: aes_out[i].eq(0xfc54a8), 0xfe: aes_out[i].eq(0xd6bb6d), 0xff: aes_out[i].eq(0x3a162c) } )

