from typing import Tuple
from cocotb.types import LogicArray, Logic

def model(d0: LogicArray, d1: LogicArray, d2: LogicArray, d3: LogicArray, s: LogicArray) -> LogicArray:
    """model of 4_14_structural"""
    low = d1 if s[0] else d0
    high = d3 if s[0] else d2
    y = high if s[1] else low
    return y
