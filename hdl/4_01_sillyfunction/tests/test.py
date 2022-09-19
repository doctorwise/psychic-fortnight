from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_1(dut):

    # iterate through the reasonable values
    values = [0, 1];

    for a_val in values:
        dut.a.value = a_val
        for b_val in values:
            dut.b.value = b_val
            for c_val in values:
                dut.c.value = c_val
                await Timer(1, units="ns")
                assert dut.y.value == model(a=a_val, b=b_val, c=c_val), \
                 f"HDL result incorrect: {dut.y.value} vs {model(a_val, b_val, c_val)}"
