from cocotb.types import LogicArray, Range

def model(data: LogicArray) -> LogicArray:
    """model of 4_23 seven segment display"""
    if data == 0:
        return LogicArray('1111110', Range(6, 'downto', 0))
    elif data == 1:
        return LogicArray('0110000', Range(6, 'downto', 0))
    elif data == 2:
        return LogicArray('1101101', Range(6, 'downto', 0))
    elif data == 3:
        return LogicArray('1111001', Range(6, 'downto', 0))
    elif data == 4:
        return LogicArray('0110011', Range(6, 'downto', 0))
    elif data == 5:
        return LogicArray('1011011', Range(6, 'downto', 0))
    elif data == 6:
        return LogicArray('1011111', Range(6, 'downto', 0))
    elif data == 7:
        return LogicArray('1110000', Range(6, 'downto', 0))
    elif data == 8:
        return LogicArray('1111111', Range(6, 'downto', 0))
    elif data == 9:
        return LogicArray('1110011', Range(6, 'downto', 0))
    else:
        return LogicArray(0, Range(6, 'downto', 0))
