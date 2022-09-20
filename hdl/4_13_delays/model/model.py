from typing import Tuple
from cocotb.types import LogicArray, Logic

def model(a: Logic, b: Logic, c: Logic) -> Logic:
    """model of 4_13_delay"""
    ab = ~a;
    bb = ~b;
    cb = ~c;
    n1 = ab & bb & cb;
    n2 = a & bb & cb;
    n3 = a & bb & c;
    return (n1 | n2 | n3);
