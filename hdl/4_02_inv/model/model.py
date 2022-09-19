from cocotb.types import Logic

def model(a: Logic) -> Logic:
    """model of 4_2 inv"""
    return not a;
