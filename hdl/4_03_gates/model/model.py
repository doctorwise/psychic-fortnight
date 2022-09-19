from typing import Tuple
from cocotb.types import Logic

def model(a: Logic, b: Logic) -> Tuple[Logic, Logic, Logic, Logic, Logic]:
    """model of 4_3 gates"""
    return a and b, a or b, a != b, not (a and b), not (a or b);
