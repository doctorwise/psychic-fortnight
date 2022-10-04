from model import model

import cocotb
from cocotb.triggers import Timer

from random import randrange

@cocotb.test()
async def test4_2(dut):

    # Note that here, instead of manually setting the values in the LogicArray,
    # we iterate through integers that can be represented via a 4-bit
    # unsigned integer representation.
    # 
    # For convenience, we also opted to compare each bit of the LogicArray 
    # via its string representation.

    for a_val in range(2**4):
        dut.a.value = randrange(2**4)
        await Timer(1, units="ns")
        assert str(dut.y.value) == str(model(dut.a.value)), \
            f"HDL result incorrect: {dut.y.value.binstr} vs {model(dut.a.value)}"
