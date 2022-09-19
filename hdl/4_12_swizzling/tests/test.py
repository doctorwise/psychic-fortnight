from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import LogicArray

@cocotb.test()
async def test4_12(dut):
    await Timer(1, units="ns")
    y = model();
    assert(dut.y.value.binstr == y.binstr, f"HDL result incorrect: {dut.y.value.binstr} vs {y.binstr}")

