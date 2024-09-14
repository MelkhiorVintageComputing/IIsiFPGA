from migen import *
from migen.genlib.fifo import *

# 10.4.3
def busy_primitive(PC = 0):
    val = 0xa400
    val = val | (PC << 14)
    return val

# 10.4.4
def null_primitive(CA = 0, PC = 0, IA = 0, PF = 0, TF = 0):
    val = 0x0800
    val = val | (CA << 15) # Come Again
    val = val | (PC << 14) # Program Counter (request)
    val = val | (IA <<  8) # Interrupts Allowed
    val = val | (PF <<  1) # Processing Finished
    val = val | (TF <<  0) # True/False
    return val

# 10.4.9
def ea_transfer_primitive(CA = 0, PC = 0, DR = 0, Valid = None, Length = None):
    assert(Valid != None)
    assert(Length != None)
    val = 0x1000
    val = val | (CA << 15)
    val = val | (PC << 14)
    val = val | (DR << 13) # Direction Bit
    val = val | (Valid << 8) # 3 bits
    val = val | (Length << 0) # 8 bits
    return val

# 10.4.13
def transfer_singlereg_primitive(CA = 0, PC = 0, DR = 0, DA = 0, Register = 0):
    val = 0x0C00
    val = val | (CA << 15)
    val = val | (PC << 14)
    val = val | (DR << 13)
    val = val | (DA <<  3)
    val = val | (Register << 0) # 3 bits
    return val

# 10.4.16
def transfer_multi_copro_regs_primitive(CA = 0, PC = 0, DR = 0, Length = None):
    assert(Length != None)
    val = 0x0100
    val = val | (CA << 15)
    val = val | (PC << 14)
    val = val | (DR << 13) # Direction Bit
    val = val | (Length << 0) # 8 bits
    return val

class Copro(Module):
    def __init__(self, cd_copro = "cpu"):

    
        ## RESP_IDLE = 0x0802
        #RESP_IDLE = null_primitive(PF = 1)
        #print(f"RESP_IDLE is \${RESP_IDLE:x}")
        ## RESP_ONGOING = 0x8900
        #RESP_ONGOING = null_primitive(CA = 1, IA = 1)
        #print(f"RESP_ONGOING is \${RESP_ONGOING:x}")
        ## RESP_EA_TRANSFER = 0x9610
        #RESP_EA_TRANSFER = ea_transfer_primitive(CA = 1, Valid = 6, Length = 16)
        #print(f"RESP_EA_TRANSFER is \${RESP_EA_TRANSFER:x}")
        ## RESP_SEND_REG = 0x8C00
        #RESP_SEND_REG = transfer_singlereg_primitive(CA = 1)
        #print(f"RESP_SEND_REG is \${RESP_SEND_REG:x}")
        ## RESP_RECV_REG = 0x2C00
        #RESP_RECV_REG = transfer_singlereg_primitive(DR = 1)
        #print(f"RESP_RECV_REG is \${RESP_RECV_REG:x}")
        
        copro_sync = getattr(self.sync, cd_copro)
        
        # register bank (32 bits) and aliases (16 or 32 bits)
        self.regs = Array(Signal(32) for x in range(0,8))
        #aliases 
        self.response  = self.regs[0][16:32]
        self.control   = self.regs[0][ 0:16]
        self.save      = self.regs[1][16:32]
        self.restore   = self.regs[1][ 0:16]
        self.operation = self.regs[2][16:32]
        self.command   = self.regs[2][ 0:16]
        self.rsvd0     = self.regs[3][16:32]
        self.condition = self.regs[3][ 0:16]
        self.operand   = self.regs[4]
        self.regselect = self.regs[5][16:32]
        self.rsvd1     = self.regs[5][ 0:16]
        self.instaddr  = self.regs[6]
        self.operaddr  = self.regs[7]

        # read/write strobe (16 bits granularity)
        self.reg_re = reg_re = Array(Signal(1) for x in range(0,16))
        self.reg_we = reg_we = Array(Signal(1) for x in range(0,16))
        
        # 16-bits granularity
        self.response_re = Signal()
        self.condition_we = Signal()
        self.command_we = Signal()
        self.operand_re = Signal()
        self.operand_we = Signal()
        # not sure we need to delay the read strobe, could be comb ?
        self.comb += [
            If(reg_re[1],
               self.response_re.eq(1),
            ).Else(
                self.response_re.eq(0),
            ),
            If(reg_re[8],
               self.operand_re.eq(1),
            ).Else(
                self.operand_re.eq(0),
            ),
        ]
        # delay by 1 cycle, otherwise the actual registers aren't ready when the strobe arrives
        copro_sync += [
            If(reg_we[4],
               self.command_we.eq(1),
            ).Else(
                self.command_we.eq(0),
            ),
            If(reg_we[6],
               self.condition_we.eq(1),
            ).Else(
                self.condition_we.eq(0),
            ),
            If(reg_we[8],
               self.operand_we.eq(1),
            ).Else(
                self.operand_we.eq(0),
            ),
        ]
