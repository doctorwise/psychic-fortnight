from typing import Tuple
from cocotb.types import LogicArray, Logic, Range

def model(a: LogicArray) -> LogicArray:
    """model of 4_35"""
    ret = LogicArray(0, Range(len(a)-1, 'downto', 0))
    ret[a.integer] = 1;
    return ret
