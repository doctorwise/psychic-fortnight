from cocotb.types import LogicArray

def model(a: LogicArray) -> LogicArray:
    """model of 4_22 inv"""
    # note that here we will use the bitwise ~ as opposed to not
    return ~a;
