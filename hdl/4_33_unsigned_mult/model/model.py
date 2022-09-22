from cocotb.types import Logic, LogicArray, Range

def model(a: LogicArray, b: LogicArray) -> LogicArray:
    """ model for 4_33 unsigned multiplier """
    return LogicArray(a.integer * b.integer)
