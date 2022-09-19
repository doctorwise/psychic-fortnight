# import this basic 4-valued logic type (0, 1, X, Z)
# (see https://docs.cocotb.org/en/stable/library_reference.html#cocotb.types.Logic)
from cocotb.types import Logic

def model(a: Logic, b: Logic, c: Logic) -> Logic:
    """model of 4_1 sillyfunction"""
    return (not a and not b and not c) \
        or (a and not b and not c) or \
        (a and not b and c);
