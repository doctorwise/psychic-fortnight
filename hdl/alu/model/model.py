from cocotb.types import Logic, LogicArray, Range

def alu(a: LogicArray, b: LogicArray, alucontrol: LogicArray) -> [LogicArray, LogicArray]:
    """model of alu logic"""

    condinvb = ~b if bool(alucontrol[0]) else b
    ret_sum = LogicArray(a.integer + condinvb.integer + int(alucontrol[0]), Range(32, 'downto', 0))

    ret0 = ret_sum

    if (bool(alucontrol[1]) == True):
        if (bool(alucontrol[0]) == False):
            ret0 = a & b
        if (bool(alucontrol[0]) == True):
            ret0 = a | b

    ret1 = LogicArray('zzzz', Range(3, 'downto', 0))
    ret1[3] = ret0[31]
    ret1[2] = (ret0[31:0].integer == 0)
    ret1[1] = (~alucontrol[1]) & ret_sum[32]
    ret1[0] = (~alucontrol[1]) & ~(a[31] ^ b[31] ^ alucontrol[0]) & (a[31] ^ ret_sum[31])

    return [ret0[31:0], ret1]
    
