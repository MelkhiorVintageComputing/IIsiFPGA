from migen import *

from litex.soc.interconnect.csr import *

import litex

class DebugRegs(Module, AutoCSR):
    def __init__(self, debug_val):

        if (debug_val is not None):        
            num_bits = len(debug_val)

            num_words = ((num_bits + 31) // 32)
            

            print(f"Debug registers for {num_bits} bits, {num_words} 32-bits CSR")

        #for i in range(0, num_endpoints):
        #    exec("self.optr_ep{0} = CSRStatus(ptr_width, name='optr_ep{0}')".format(i))
        #    optrs.append(getattr(self, "optr_ep{}".format(i)).status)
            
            for x in range(0, num_words):
                name = f"csr_debug_{x}"
                desc = f"debug_{x}"
                exec(f"self.csr_debug_{x} = CSRStatus(fields = [CSRField('val',  32, description = desc),], name = name)")
                self.comb += [ getattr(self, name).fields.val.eq(debug_val[x*32 : x*32 + 32]), ]

        else: # debug is none => error
            assert(False)
