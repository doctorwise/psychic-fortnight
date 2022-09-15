from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_1(dut):
    for a_val in range(1):
        dut.a.value = a_val
        for b_val in range(1):
            dut.b.value = b_val
            for c_val in range(1):
                dut.c.value = c_val
                await Timer(1, units="ns")
                assert dut.y.value == model(a_val, b_val, c_val), f"HDL result incorrect: {dut.y.value} vs {model(a_val, b_val, c_val)}"
