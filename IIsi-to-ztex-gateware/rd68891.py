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
        aesdec_out = Array(Signal(32) for a in range(0, 4))

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

        decpattern0 = Signal(32)
        decpattern1 = Signal(32)
        decpattern2 = Signal(32)
        decpattern3 = Signal(32)
        aesdec_rsb0 = Signal(8)
        aesdec_rsb1 = Signal(8)
        aesdec_rsb2 = Signal(8)
        aesdec_rsb3 = Signal(8)
        self.comb += [
            aesdec_rsb0.eq(aesdec_out[0][24:32] ^ aesdec_out[0][16:24] ^ aesdec_out[0][ 8:16] ^ aesdec_out[0][ 0: 8]),
            aesdec_rsb1.eq(aesdec_out[1][24:32] ^ aesdec_out[1][16:24] ^ aesdec_out[1][ 8:16] ^ aesdec_out[1][ 0: 8]),
            aesdec_rsb2.eq(aesdec_out[2][24:32] ^ aesdec_out[2][16:24] ^ aesdec_out[2][ 8:16] ^ aesdec_out[2][ 0: 8]),
            aesdec_rsb3.eq(aesdec_out[3][24:32] ^ aesdec_out[3][16:24] ^ aesdec_out[3][ 8:16] ^ aesdec_out[3][ 0: 8]),
        ],
        
        self.comb += If(~alllast,
                        decpattern0.eq(Cat(aesdec_out[0][24:32], aesdec_out[0][16:24], aesdec_out[0][ 8:16], aesdec_out[0][ 0: 8])),
                     ).Else(
                         decpattern0.eq(Cat(Signal(24, reset = 0), aesdec_rsb0)),
                     )
        self.comb += If(~alllast,
                        decpattern1.eq(Cat(aesdec_out[3][16:24], aesdec_out[3][ 8:16], aesdec_out[3][ 0: 8], aesdec_out[3][24:32])),
                     ).Else(
                         decpattern1.eq(Cat(Signal(16, reset = 0), aesdec_rsb3, Signal(8, reset = 0))),
                     )
        self.comb += If(~alllast,
                        decpattern2.eq(Cat(aesdec_out[2][ 8:16], aesdec_out[2][ 0: 8], aesdec_out[2][24:32], aesdec_out[2][16:24])),
                     ).Else(
                         decpattern2.eq(Cat(Signal(8, reset = 0), aesdec_rsb2, Signal(16, reset = 0))),
                     )
        self.comb += If(~alllast,
                        decpattern3.eq(Cat(aesdec_out[1][ 0: 8], aesdec_out[1][24:32], aesdec_out[1][16:24], aesdec_out[1][ 8:16])),
                     ).Else(
                         decpattern3.eq(Cat(aesdec_rsb1, Signal(24, reset = 0))),
                     )

        
        krypto_fsm.act("Compute",
                       If(~encdec,
                          NextValue(operand, rs1 ^ pattern0 ^ pattern1 ^ pattern2 ^ pattern3),
                       ).Else(
                          NextValue(operand, rs1 ^ decpattern0 ^ decpattern1 ^ decpattern2 ^ decpattern3),
                       ),
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

        ## there's probably a better way...
        # encrypt
        for i in range(4):
            krypto_sync += Case(aes_in[i], { 0x00: aes_out[i].eq(0xa563c6), 0x01: aes_out[i].eq(0x847cf8), 0x02: aes_out[i].eq(0x9977ee), 0x03: aes_out[i].eq(0x8d7bf6), 0x04: aes_out[i].eq(0x0df2ff), 0x05: aes_out[i].eq(0xbd6bd6), 0x06: aes_out[i].eq(0xb16fde), 0x07: aes_out[i].eq(0x54c591), 0x08: aes_out[i].eq(0x503060), 0x09: aes_out[i].eq(0x030102), 0x0a: aes_out[i].eq(0xa967ce), 0x0b: aes_out[i].eq(0x7d2b56), 0x0c: aes_out[i].eq(0x19fee7), 0x0d: aes_out[i].eq(0x62d7b5), 0x0e: aes_out[i].eq(0xe6ab4d), 0x0f: aes_out[i].eq(0x9a76ec), 0x10: aes_out[i].eq(0x45ca8f), 0x11: aes_out[i].eq(0x9d821f), 0x12: aes_out[i].eq(0x40c989), 0x13: aes_out[i].eq(0x877dfa), 0x14: aes_out[i].eq(0x15faef), 0x15: aes_out[i].eq(0xeb59b2), 0x16: aes_out[i].eq(0xc9478e), 0x17: aes_out[i].eq(0x0bf0fb), 0x18: aes_out[i].eq(0xecad41), 0x19: aes_out[i].eq(0x67d4b3), 0x1a: aes_out[i].eq(0xfda25f), 0x1b: aes_out[i].eq(0xeaaf45), 0x1c: aes_out[i].eq(0xbf9c23), 0x1d: aes_out[i].eq(0xf7a453), 0x1e: aes_out[i].eq(0x9672e4), 0x1f: aes_out[i].eq(0x5bc09b), 0x20: aes_out[i].eq(0xc2b775), 0x21: aes_out[i].eq(0x1cfde1), 0x22: aes_out[i].eq(0xae933d), 0x23: aes_out[i].eq(0x6a264c), 0x24: aes_out[i].eq(0x5a366c), 0x25: aes_out[i].eq(0x413f7e), 0x26: aes_out[i].eq(0x02f7f5), 0x27: aes_out[i].eq(0x4fcc83), 0x28: aes_out[i].eq(0x5c3468), 0x29: aes_out[i].eq(0xf4a551), 0x2a: aes_out[i].eq(0x34e5d1), 0x2b: aes_out[i].eq(0x08f1f9), 0x2c: aes_out[i].eq(0x9371e2), 0x2d: aes_out[i].eq(0x73d8ab), 0x2e: aes_out[i].eq(0x533162), 0x2f: aes_out[i].eq(0x3f152a), 0x30: aes_out[i].eq(0x0c0408), 0x31: aes_out[i].eq(0x52c795), 0x32: aes_out[i].eq(0x652346), 0x33: aes_out[i].eq(0x5ec39d), 0x34: aes_out[i].eq(0x281830), 0x35: aes_out[i].eq(0xa19637), 0x36: aes_out[i].eq(0x0f050a), 0x37: aes_out[i].eq(0xb59a2f), 0x38: aes_out[i].eq(0x09070e), 0x39: aes_out[i].eq(0x361224), 0x3a: aes_out[i].eq(0x9b801b), 0x3b: aes_out[i].eq(0x3de2df), 0x3c: aes_out[i].eq(0x26ebcd), 0x3d: aes_out[i].eq(0x69274e), 0x3e: aes_out[i].eq(0xcdb27f), 0x3f: aes_out[i].eq(0x9f75ea), 0x40: aes_out[i].eq(0x1b0912), 0x41: aes_out[i].eq(0x9e831d), 0x42: aes_out[i].eq(0x742c58), 0x43: aes_out[i].eq(0x2e1a34), 0x44: aes_out[i].eq(0x2d1b36), 0x45: aes_out[i].eq(0xb26edc), 0x46: aes_out[i].eq(0xee5ab4), 0x47: aes_out[i].eq(0xfba05b), 0x48: aes_out[i].eq(0xf652a4), 0x49: aes_out[i].eq(0x4d3b76), 0x4a: aes_out[i].eq(0x61d6b7), 0x4b: aes_out[i].eq(0xceb37d), 0x4c: aes_out[i].eq(0x7b2952), 0x4d: aes_out[i].eq(0x3ee3dd), 0x4e: aes_out[i].eq(0x712f5e), 0x4f: aes_out[i].eq(0x978413), 0x50: aes_out[i].eq(0xf553a6), 0x51: aes_out[i].eq(0x68d1b9), 0x52: aes_out[i].eq(0x000000), 0x53: aes_out[i].eq(0x2cedc1), 0x54: aes_out[i].eq(0x602040), 0x55: aes_out[i].eq(0x1ffce3), 0x56: aes_out[i].eq(0xc8b179), 0x57: aes_out[i].eq(0xed5bb6), 0x58: aes_out[i].eq(0xbe6ad4), 0x59: aes_out[i].eq(0x46cb8d), 0x5a: aes_out[i].eq(0xd9be67), 0x5b: aes_out[i].eq(0x4b3972), 0x5c: aes_out[i].eq(0xde4a94), 0x5d: aes_out[i].eq(0xd44c98), 0x5e: aes_out[i].eq(0xe858b0), 0x5f: aes_out[i].eq(0x4acf85), 0x60: aes_out[i].eq(0x6bd0bb), 0x61: aes_out[i].eq(0x2aefc5), 0x62: aes_out[i].eq(0xe5aa4f), 0x63: aes_out[i].eq(0x16fbed), 0x64: aes_out[i].eq(0xc54386), 0x65: aes_out[i].eq(0xd74d9a), 0x66: aes_out[i].eq(0x553366), 0x67: aes_out[i].eq(0x948511), 0x68: aes_out[i].eq(0xcf458a), 0x69: aes_out[i].eq(0x10f9e9), 0x6a: aes_out[i].eq(0x060204), 0x6b: aes_out[i].eq(0x817ffe), 0x6c: aes_out[i].eq(0xf050a0), 0x6d: aes_out[i].eq(0x443c78), 0x6e: aes_out[i].eq(0xba9f25), 0x6f: aes_out[i].eq(0xe3a84b), 0x70: aes_out[i].eq(0xf351a2), 0x71: aes_out[i].eq(0xfea35d), 0x72: aes_out[i].eq(0xc04080), 0x73: aes_out[i].eq(0x8a8f05), 0x74: aes_out[i].eq(0xad923f), 0x75: aes_out[i].eq(0xbc9d21), 0x76: aes_out[i].eq(0x483870), 0x77: aes_out[i].eq(0x04f5f1), 0x78: aes_out[i].eq(0xdfbc63), 0x79: aes_out[i].eq(0xc1b677), 0x7a: aes_out[i].eq(0x75daaf), 0x7b: aes_out[i].eq(0x632142), 0x7c: aes_out[i].eq(0x301020), 0x7d: aes_out[i].eq(0x1affe5), 0x7e: aes_out[i].eq(0x0ef3fd), 0x7f: aes_out[i].eq(0x6dd2bf), 0x80: aes_out[i].eq(0x4ccd81), 0x81: aes_out[i].eq(0x140c18), 0x82: aes_out[i].eq(0x351326), 0x83: aes_out[i].eq(0x2fecc3), 0x84: aes_out[i].eq(0xe15fbe), 0x85: aes_out[i].eq(0xa29735), 0x86: aes_out[i].eq(0xcc4488), 0x87: aes_out[i].eq(0x39172e), 0x88: aes_out[i].eq(0x57c493), 0x89: aes_out[i].eq(0xf2a755), 0x8a: aes_out[i].eq(0x827efc), 0x8b: aes_out[i].eq(0x473d7a), 0x8c: aes_out[i].eq(0xac64c8), 0x8d: aes_out[i].eq(0xe75dba), 0x8e: aes_out[i].eq(0x2b1932), 0x8f: aes_out[i].eq(0x9573e6), 0x90: aes_out[i].eq(0xa060c0), 0x91: aes_out[i].eq(0x988119), 0x92: aes_out[i].eq(0xd14f9e), 0x93: aes_out[i].eq(0x7fdca3), 0x94: aes_out[i].eq(0x662244), 0x95: aes_out[i].eq(0x7e2a54), 0x96: aes_out[i].eq(0xab903b), 0x97: aes_out[i].eq(0x83880b), 0x98: aes_out[i].eq(0xca468c), 0x99: aes_out[i].eq(0x29eec7), 0x9a: aes_out[i].eq(0xd3b86b), 0x9b: aes_out[i].eq(0x3c1428), 0x9c: aes_out[i].eq(0x79dea7), 0x9d: aes_out[i].eq(0xe25ebc), 0x9e: aes_out[i].eq(0x1d0b16), 0x9f: aes_out[i].eq(0x76dbad), 0xa0: aes_out[i].eq(0x3be0db), 0xa1: aes_out[i].eq(0x563264), 0xa2: aes_out[i].eq(0x4e3a74), 0xa3: aes_out[i].eq(0x1e0a14), 0xa4: aes_out[i].eq(0xdb4992), 0xa5: aes_out[i].eq(0x0a060c), 0xa6: aes_out[i].eq(0x6c2448), 0xa7: aes_out[i].eq(0xe45cb8), 0xa8: aes_out[i].eq(0x5dc29f), 0xa9: aes_out[i].eq(0x6ed3bd), 0xaa: aes_out[i].eq(0xefac43), 0xab: aes_out[i].eq(0xa662c4), 0xac: aes_out[i].eq(0xa89139), 0xad: aes_out[i].eq(0xa49531), 0xae: aes_out[i].eq(0x37e4d3), 0xaf: aes_out[i].eq(0x8b79f2), 0xb0: aes_out[i].eq(0x32e7d5), 0xb1: aes_out[i].eq(0x43c88b), 0xb2: aes_out[i].eq(0x59376e), 0xb3: aes_out[i].eq(0xb76dda), 0xb4: aes_out[i].eq(0x8c8d01), 0xb5: aes_out[i].eq(0x64d5b1), 0xb6: aes_out[i].eq(0xd24e9c), 0xb7: aes_out[i].eq(0xe0a949), 0xb8: aes_out[i].eq(0xb46cd8), 0xb9: aes_out[i].eq(0xfa56ac), 0xba: aes_out[i].eq(0x07f4f3), 0xbb: aes_out[i].eq(0x25eacf), 0xbc: aes_out[i].eq(0xaf65ca), 0xbd: aes_out[i].eq(0x8e7af4), 0xbe: aes_out[i].eq(0xe9ae47), 0xbf: aes_out[i].eq(0x180810), 0xc0: aes_out[i].eq(0xd5ba6f), 0xc1: aes_out[i].eq(0x8878f0), 0xc2: aes_out[i].eq(0x6f254a), 0xc3: aes_out[i].eq(0x722e5c), 0xc4: aes_out[i].eq(0x241c38), 0xc5: aes_out[i].eq(0xf1a657), 0xc6: aes_out[i].eq(0xc7b473), 0xc7: aes_out[i].eq(0x51c697), 0xc8: aes_out[i].eq(0x23e8cb), 0xc9: aes_out[i].eq(0x7cdda1), 0xca: aes_out[i].eq(0x9c74e8), 0xcb: aes_out[i].eq(0x211f3e), 0xcc: aes_out[i].eq(0xdd4b96), 0xcd: aes_out[i].eq(0xdcbd61), 0xce: aes_out[i].eq(0x868b0d), 0xcf: aes_out[i].eq(0x858a0f), 0xd0: aes_out[i].eq(0x9070e0), 0xd1: aes_out[i].eq(0x423e7c), 0xd2: aes_out[i].eq(0xc4b571), 0xd3: aes_out[i].eq(0xaa66cc), 0xd4: aes_out[i].eq(0xd84890), 0xd5: aes_out[i].eq(0x050306), 0xd6: aes_out[i].eq(0x01f6f7), 0xd7: aes_out[i].eq(0x120e1c), 0xd8: aes_out[i].eq(0xa361c2), 0xd9: aes_out[i].eq(0x5f356a), 0xda: aes_out[i].eq(0xf957ae), 0xdb: aes_out[i].eq(0xd0b969), 0xdc: aes_out[i].eq(0x918617), 0xdd: aes_out[i].eq(0x58c199), 0xde: aes_out[i].eq(0x271d3a), 0xdf: aes_out[i].eq(0xb99e27), 0xe0: aes_out[i].eq(0x38e1d9), 0xe1: aes_out[i].eq(0x13f8eb), 0xe2: aes_out[i].eq(0xb3982b), 0xe3: aes_out[i].eq(0x331122), 0xe4: aes_out[i].eq(0xbb69d2), 0xe5: aes_out[i].eq(0x70d9a9), 0xe6: aes_out[i].eq(0x898e07), 0xe7: aes_out[i].eq(0xa79433), 0xe8: aes_out[i].eq(0xb69b2d), 0xe9: aes_out[i].eq(0x221e3c), 0xea: aes_out[i].eq(0x928715), 0xeb: aes_out[i].eq(0x20e9c9), 0xec: aes_out[i].eq(0x49ce87), 0xed: aes_out[i].eq(0xff55aa), 0xee: aes_out[i].eq(0x782850), 0xef: aes_out[i].eq(0x7adfa5), 0xf0: aes_out[i].eq(0x8f8c03), 0xf1: aes_out[i].eq(0xf8a159), 0xf2: aes_out[i].eq(0x808909), 0xf3: aes_out[i].eq(0x170d1a), 0xf4: aes_out[i].eq(0xdabf65), 0xf5: aes_out[i].eq(0x31e6d7), 0xf6: aes_out[i].eq(0xc64284), 0xf7: aes_out[i].eq(0xb868d0), 0xf8: aes_out[i].eq(0xc34182), 0xf9: aes_out[i].eq(0xb09929), 0xfa: aes_out[i].eq(0x772d5a), 0xfb: aes_out[i].eq(0x110f1e), 0xfc: aes_out[i].eq(0xcbb07b), 0xfd: aes_out[i].eq(0xfc54a8), 0xfe: aes_out[i].eq(0xd6bb6d), 0xff: aes_out[i].eq(0x3a162c) } )

        for i in range(0, 4):
             krypto_sync += Case(aes_in[i], { 0x00: aesdec_out[i].eq(0x50a7f451), 0x01: aesdec_out[i].eq(0x5365417e), 0x02: aesdec_out[i].eq(0xc3a4171a), 0x03: aesdec_out[i].eq(0x965e273a), 0x04: aesdec_out[i].eq(0xcb6bab3b), 0x05: aesdec_out[i].eq(0xf1459d1f), 0x06: aesdec_out[i].eq(0xab58faac), 0x07: aesdec_out[i].eq(0x9303e34b), 0x08: aesdec_out[i].eq(0x55fa3020), 0x09: aesdec_out[i].eq(0xf66d76ad), 0x0a: aesdec_out[i].eq(0x9176cc88), 0x0b: aesdec_out[i].eq(0x254c02f5), 0x0c: aesdec_out[i].eq(0xfcd7e54f), 0x0d: aesdec_out[i].eq(0xd7cb2ac5), 0x0e: aesdec_out[i].eq(0x80443526), 0x0f: aesdec_out[i].eq(0x8fa362b5), 0x10: aesdec_out[i].eq(0x495ab1de), 0x11: aesdec_out[i].eq(0x671bba25), 0x12: aesdec_out[i].eq(0x980eea45), 0x13: aesdec_out[i].eq(0xe1c0fe5d), 0x14: aesdec_out[i].eq(0x02752fc3), 0x15: aesdec_out[i].eq(0x12f04c81), 0x16: aesdec_out[i].eq(0xa397468d), 0x17: aesdec_out[i].eq(0xc6f9d36b), 0x18: aesdec_out[i].eq(0xe75f8f03), 0x19: aesdec_out[i].eq(0x959c9215), 0x1a: aesdec_out[i].eq(0xeb7a6dbf), 0x1b: aesdec_out[i].eq(0xda595295), 0x1c: aesdec_out[i].eq(0x2d83bed4), 0x1d: aesdec_out[i].eq(0xd3217458), 0x1e: aesdec_out[i].eq(0x2969e049), 0x1f: aesdec_out[i].eq(0x44c8c98e), 0x20: aesdec_out[i].eq(0x6a89c275), 0x21: aesdec_out[i].eq(0x78798ef4), 0x22: aesdec_out[i].eq(0x6b3e5899), 0x23: aesdec_out[i].eq(0xdd71b927), 0x24: aesdec_out[i].eq(0xb64fe1be), 0x25: aesdec_out[i].eq(0x17ad88f0), 0x26: aesdec_out[i].eq(0x66ac20c9), 0x27: aesdec_out[i].eq(0xb43ace7d), 0x28: aesdec_out[i].eq(0x184adf63), 0x29: aesdec_out[i].eq(0x82311ae5), 0x2a: aesdec_out[i].eq(0x60335197), 0x2b: aesdec_out[i].eq(0x457f5362), 0x2c: aesdec_out[i].eq(0xe07764b1), 0x2d: aesdec_out[i].eq(0x84ae6bbb), 0x2e: aesdec_out[i].eq(0x1ca081fe), 0x2f: aesdec_out[i].eq(0x942b08f9), 0x30: aesdec_out[i].eq(0x58684870), 0x31: aesdec_out[i].eq(0x19fd458f), 0x32: aesdec_out[i].eq(0x876cde94), 0x33: aesdec_out[i].eq(0xb7f87b52), 0x34: aesdec_out[i].eq(0x23d373ab), 0x35: aesdec_out[i].eq(0xe2024b72), 0x36: aesdec_out[i].eq(0x578f1fe3), 0x37: aesdec_out[i].eq(0x2aab5566), 0x38: aesdec_out[i].eq(0x0728ebb2), 0x39: aesdec_out[i].eq(0x03c2b52f), 0x3a: aesdec_out[i].eq(0x9a7bc586), 0x3b: aesdec_out[i].eq(0xa50837d3), 0x3c: aesdec_out[i].eq(0xf2872830), 0x3d: aesdec_out[i].eq(0xb2a5bf23), 0x3e: aesdec_out[i].eq(0xba6a0302), 0x3f: aesdec_out[i].eq(0x5c8216ed), 0x40: aesdec_out[i].eq(0x2b1ccf8a), 0x41: aesdec_out[i].eq(0x92b479a7), 0x42: aesdec_out[i].eq(0xf0f207f3), 0x43: aesdec_out[i].eq(0xa1e2694e), 0x44: aesdec_out[i].eq(0xcdf4da65), 0x45: aesdec_out[i].eq(0xd5be0506), 0x46: aesdec_out[i].eq(0x1f6234d1), 0x47: aesdec_out[i].eq(0x8afea6c4), 0x48: aesdec_out[i].eq(0x9d532e34), 0x49: aesdec_out[i].eq(0xa055f3a2), 0x4a: aesdec_out[i].eq(0x32e18a05), 0x4b: aesdec_out[i].eq(0x75ebf6a4), 0x4c: aesdec_out[i].eq(0x39ec830b), 0x4d: aesdec_out[i].eq(0xaaef6040), 0x4e: aesdec_out[i].eq(0x069f715e), 0x4f: aesdec_out[i].eq(0x51106ebd), 0x50: aesdec_out[i].eq(0xf98a213e), 0x51: aesdec_out[i].eq(0x3d06dd96), 0x52: aesdec_out[i].eq(0xae053edd), 0x53: aesdec_out[i].eq(0x46bde64d), 0x54: aesdec_out[i].eq(0xb58d5491), 0x55: aesdec_out[i].eq(0x055dc471), 0x56: aesdec_out[i].eq(0x6fd40604), 0x57: aesdec_out[i].eq(0xff155060), 0x58: aesdec_out[i].eq(0x24fb9819), 0x59: aesdec_out[i].eq(0x97e9bdd6), 0x5a: aesdec_out[i].eq(0xcc434089), 0x5b: aesdec_out[i].eq(0x779ed967), 0x5c: aesdec_out[i].eq(0xbd42e8b0), 0x5d: aesdec_out[i].eq(0x888b8907), 0x5e: aesdec_out[i].eq(0x385b19e7), 0x5f: aesdec_out[i].eq(0xdbeec879), 0x60: aesdec_out[i].eq(0x470a7ca1), 0x61: aesdec_out[i].eq(0xe90f427c), 0x62: aesdec_out[i].eq(0xc91e84f8), 0x63: aesdec_out[i].eq(0x00000000), 0x64: aesdec_out[i].eq(0x83868009), 0x65: aesdec_out[i].eq(0x48ed2b32), 0x66: aesdec_out[i].eq(0xac70111e), 0x67: aesdec_out[i].eq(0x4e725a6c), 0x68: aesdec_out[i].eq(0xfbff0efd), 0x69: aesdec_out[i].eq(0x5638850f), 0x6a: aesdec_out[i].eq(0x1ed5ae3d), 0x6b: aesdec_out[i].eq(0x27392d36), 0x6c: aesdec_out[i].eq(0x64d90f0a), 0x6d: aesdec_out[i].eq(0x21a65c68), 0x6e: aesdec_out[i].eq(0xd1545b9b), 0x6f: aesdec_out[i].eq(0x3a2e3624), 0x70: aesdec_out[i].eq(0xb1670a0c), 0x71: aesdec_out[i].eq(0x0fe75793), 0x72: aesdec_out[i].eq(0xd296eeb4), 0x73: aesdec_out[i].eq(0x9e919b1b), 0x74: aesdec_out[i].eq(0x4fc5c080), 0x75: aesdec_out[i].eq(0xa220dc61), 0x76: aesdec_out[i].eq(0x694b775a), 0x77: aesdec_out[i].eq(0x161a121c), 0x78: aesdec_out[i].eq(0x0aba93e2), 0x79: aesdec_out[i].eq(0xe52aa0c0), 0x7a: aesdec_out[i].eq(0x43e0223c), 0x7b: aesdec_out[i].eq(0x1d171b12), 0x7c: aesdec_out[i].eq(0x0b0d090e), 0x7d: aesdec_out[i].eq(0xadc78bf2), 0x7e: aesdec_out[i].eq(0xb9a8b62d), 0x7f: aesdec_out[i].eq(0xc8a91e14), 0x80: aesdec_out[i].eq(0x8519f157), 0x81: aesdec_out[i].eq(0x4c0775af), 0x82: aesdec_out[i].eq(0xbbdd99ee), 0x83: aesdec_out[i].eq(0xfd607fa3), 0x84: aesdec_out[i].eq(0x9f2601f7), 0x85: aesdec_out[i].eq(0xbcf5725c), 0x86: aesdec_out[i].eq(0xc53b6644), 0x87: aesdec_out[i].eq(0x347efb5b), 0x88: aesdec_out[i].eq(0x7629438b), 0x89: aesdec_out[i].eq(0xdcc623cb), 0x8a: aesdec_out[i].eq(0x68fcedb6), 0x8b: aesdec_out[i].eq(0x63f1e4b8), 0x8c: aesdec_out[i].eq(0xcadc31d7), 0x8d: aesdec_out[i].eq(0x10856342), 0x8e: aesdec_out[i].eq(0x40229713), 0x8f: aesdec_out[i].eq(0x2011c684), 0x90: aesdec_out[i].eq(0x7d244a85), 0x91: aesdec_out[i].eq(0xf83dbbd2), 0x92: aesdec_out[i].eq(0x1132f9ae), 0x93: aesdec_out[i].eq(0x6da129c7), 0x94: aesdec_out[i].eq(0x4b2f9e1d), 0x95: aesdec_out[i].eq(0xf330b2dc), 0x96: aesdec_out[i].eq(0xec52860d), 0x97: aesdec_out[i].eq(0xd0e3c177), 0x98: aesdec_out[i].eq(0x6c16b32b), 0x99: aesdec_out[i].eq(0x99b970a9), 0x9a: aesdec_out[i].eq(0xfa489411), 0x9b: aesdec_out[i].eq(0x2264e947), 0x9c: aesdec_out[i].eq(0xc48cfca8), 0x9d: aesdec_out[i].eq(0x1a3ff0a0), 0x9e: aesdec_out[i].eq(0xd82c7d56), 0x9f: aesdec_out[i].eq(0xef903322), 0xa0: aesdec_out[i].eq(0xc74e4987), 0xa1: aesdec_out[i].eq(0xc1d138d9), 0xa2: aesdec_out[i].eq(0xfea2ca8c), 0xa3: aesdec_out[i].eq(0x360bd498), 0xa4: aesdec_out[i].eq(0xcf81f5a6), 0xa5: aesdec_out[i].eq(0x28de7aa5), 0xa6: aesdec_out[i].eq(0x268eb7da), 0xa7: aesdec_out[i].eq(0xa4bfad3f), 0xa8: aesdec_out[i].eq(0xe49d3a2c), 0xa9: aesdec_out[i].eq(0x0d927850), 0xaa: aesdec_out[i].eq(0x9bcc5f6a), 0xab: aesdec_out[i].eq(0x62467e54), 0xac: aesdec_out[i].eq(0xc2138df6), 0xad: aesdec_out[i].eq(0xe8b8d890), 0xae: aesdec_out[i].eq(0x5ef7392e), 0xaf: aesdec_out[i].eq(0xf5afc382), 0xb0: aesdec_out[i].eq(0xbe805d9f), 0xb1: aesdec_out[i].eq(0x7c93d069), 0xb2: aesdec_out[i].eq(0xa92dd56f), 0xb3: aesdec_out[i].eq(0xb31225cf), 0xb4: aesdec_out[i].eq(0x3b99acc8), 0xb5: aesdec_out[i].eq(0xa77d1810), 0xb6: aesdec_out[i].eq(0x6e639ce8), 0xb7: aesdec_out[i].eq(0x7bbb3bdb), 0xb8: aesdec_out[i].eq(0x097826cd), 0xb9: aesdec_out[i].eq(0xf418596e), 0xba: aesdec_out[i].eq(0x01b79aec), 0xbb: aesdec_out[i].eq(0xa89a4f83), 0xbc: aesdec_out[i].eq(0x656e95e6), 0xbd: aesdec_out[i].eq(0x7ee6ffaa), 0xbe: aesdec_out[i].eq(0x08cfbc21), 0xbf: aesdec_out[i].eq(0xe6e815ef), 0xc0: aesdec_out[i].eq(0xd99be7ba), 0xc1: aesdec_out[i].eq(0xce366f4a), 0xc2: aesdec_out[i].eq(0xd4099fea), 0xc3: aesdec_out[i].eq(0xd67cb029), 0xc4: aesdec_out[i].eq(0xafb2a431), 0xc5: aesdec_out[i].eq(0x31233f2a), 0xc6: aesdec_out[i].eq(0x3094a5c6), 0xc7: aesdec_out[i].eq(0xc066a235), 0xc8: aesdec_out[i].eq(0x37bc4e74), 0xc9: aesdec_out[i].eq(0xa6ca82fc), 0xca: aesdec_out[i].eq(0xb0d090e0), 0xcb: aesdec_out[i].eq(0x15d8a733), 0xcc: aesdec_out[i].eq(0x4a9804f1), 0xcd: aesdec_out[i].eq(0xf7daec41), 0xce: aesdec_out[i].eq(0x0e50cd7f), 0xcf: aesdec_out[i].eq(0x2ff69117), 0xd0: aesdec_out[i].eq(0x8dd64d76), 0xd1: aesdec_out[i].eq(0x4db0ef43), 0xd2: aesdec_out[i].eq(0x544daacc), 0xd3: aesdec_out[i].eq(0xdf0496e4), 0xd4: aesdec_out[i].eq(0xe3b5d19e), 0xd5: aesdec_out[i].eq(0x1b886a4c), 0xd6: aesdec_out[i].eq(0xb81f2cc1), 0xd7: aesdec_out[i].eq(0x7f516546), 0xd8: aesdec_out[i].eq(0x04ea5e9d), 0xd9: aesdec_out[i].eq(0x5d358c01), 0xda: aesdec_out[i].eq(0x737487fa), 0xdb: aesdec_out[i].eq(0x2e410bfb), 0xdc: aesdec_out[i].eq(0x5a1d67b3), 0xdd: aesdec_out[i].eq(0x52d2db92), 0xde: aesdec_out[i].eq(0x335610e9), 0xdf: aesdec_out[i].eq(0x1347d66d), 0xe0: aesdec_out[i].eq(0x8c61d79a), 0xe1: aesdec_out[i].eq(0x7a0ca137), 0xe2: aesdec_out[i].eq(0x8e14f859), 0xe3: aesdec_out[i].eq(0x893c13eb), 0xe4: aesdec_out[i].eq(0xee27a9ce), 0xe5: aesdec_out[i].eq(0x35c961b7), 0xe6: aesdec_out[i].eq(0xede51ce1), 0xe7: aesdec_out[i].eq(0x3cb1477a), 0xe8: aesdec_out[i].eq(0x59dfd29c), 0xe9: aesdec_out[i].eq(0x3f73f255), 0xea: aesdec_out[i].eq(0x79ce1418), 0xeb: aesdec_out[i].eq(0xbf37c773), 0xec: aesdec_out[i].eq(0xeacdf753), 0xed: aesdec_out[i].eq(0x5baafd5f), 0xee: aesdec_out[i].eq(0x146f3ddf), 0xef: aesdec_out[i].eq(0x86db4478), 0xf0: aesdec_out[i].eq(0x81f3afca), 0xf1: aesdec_out[i].eq(0x3ec468b9), 0xf2: aesdec_out[i].eq(0x2c342438), 0xf3: aesdec_out[i].eq(0x5f40a3c2), 0xf4: aesdec_out[i].eq(0x72c31d16), 0xf5: aesdec_out[i].eq(0x0c25e2bc), 0xf6: aesdec_out[i].eq(0x8b493c28), 0xf7: aesdec_out[i].eq(0x41950dff), 0xf8: aesdec_out[i].eq(0x7101a839), 0xf9: aesdec_out[i].eq(0xdeb30c08), 0xfa: aesdec_out[i].eq(0x9ce4b4d8), 0xfb: aesdec_out[i].eq(0x90c15664), 0xfc: aesdec_out[i].eq(0x6184cb7b), 0xfd: aesdec_out[i].eq(0x70b632d5), 0xfe: aesdec_out[i].eq(0x745c6c48), 0xff: aesdec_out[i].eq(0x4257b8d0), } )
