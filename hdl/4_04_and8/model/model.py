from typing import Tuple
from cocotb.types import Logic
from cocotb.types import LogicArray

def model(a: LogicArray) -> Logic:
    """model of 4_4 gates"""
    result = True
    for idx in range(len(a)):
        result = result and a[idx]
    return result;
