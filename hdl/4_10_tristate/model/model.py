from typing import Tuple
from cocotb.types import LogicArray, Logic

def model(a: LogicArray, en: Logic) -> Logic:
    """model of 4_10 tristate"""
    return a if en else LogicArray("ZZZZ");
