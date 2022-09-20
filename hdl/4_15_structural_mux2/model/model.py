from typing import Tuple
from cocotb.types import LogicArray, Logic

def model(d0: LogicArray, d1: LogicArray, s: Logic) -> LogicArray:
    """model of 4_14_structural"""
    return d1 if s else d0
