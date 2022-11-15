from cocotb.types import Logic, LogicArray, Range

def model(immsrc: LogicArray, instr: LogicArray) -> LogicArray:
    """model of extender logic"""
    extimm = LogicArray(0, Range(31, 'downto', 0))

    if (immsrc.integer == 0):
        for idx in range(8):
            extimm[idx] = int(instr[23 - idx])
    elif (immsrc.integer == 1):
        for idx in range(12):
            extimm[idx] = int(instr[23 - idx])
    elif (immsrc.integer == 2):
        signBit = instr[0]
        for idx in range(26, 32, 1):
            extimm[idx] = int(signBit)
        for idx in range(24):
            extimm[idx + 2] = int(instr[23 - idx])
    else:
        raise Exception("Unsupported immsrc")
    
    return extimm
