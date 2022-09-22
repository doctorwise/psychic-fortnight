from typing import Tuple
from cocotb.types import LogicArray, Logic

def model(d0: LogicArray, d1: LogicArray, s: Logic) -> LogicArray:
    """model of 4_34_mux2"""
    return d1 if s else d0
