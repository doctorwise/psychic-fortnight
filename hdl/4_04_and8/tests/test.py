from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_4(dut):
    for bitValue in range(2**8):
        dut.a.value = bitValue
        await Timer(1, units="ns")
        y = model(dut.a.value)
        assert dut.y.value == y, f"HDL result incorrect: {dut.y.value} vs {y}"
