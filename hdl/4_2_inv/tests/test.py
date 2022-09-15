from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_2(dut):
    for a_val in range(1):
        dut.a.value = a_val
        await Timer(1, units="ns")
        assert dut.y.value == model(a_val), f"HDL result incorrect: {dut.y.value} vs {model(a_val)}"
