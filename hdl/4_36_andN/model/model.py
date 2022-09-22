from typing import Tuple
from cocotb.types import LogicArray, Logic, Range

def model(a: LogicArray) -> Logic:
    """model of 4_36"""
    ret = True
    for idx in range(len(a)):
        ret = ret and a[idx]
    return Logic(ret)
