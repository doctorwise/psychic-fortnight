from cocotb.types import *

def model(a: Logic, b: Logic, c: Logic) -> Logic:
    """model of 4_1 sillyfunction"""
    return (not a and not b and not c) or (a and not b and not c) or (a and not b and c);
