from cocotb.types import LogicArray, Range

def model(data: LogicArray) -> LogicArray:
    """model of 4_26 priority circuit"""
    if   data[3]:
        return LogicArray('1000', Range(3, 'downto', 0))
    elif data[2]:
        return LogicArray('0100', Range(3, 'downto', 0))
    elif data[1]:
        return LogicArray('0010', Range(3, 'downto', 0))
    elif data[0]:
        return LogicArray('0001', Range(3, 'downto', 0))
    else:
        return LogicArray('0000', Range(3, 'downto', 0))
