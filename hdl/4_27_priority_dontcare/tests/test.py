from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import LogicArray, Range

@cocotb.test()
async def test4_28(dut):
    for data in range(2**4):
        dut.a.value = data
        await Timer(1, units="ns")
        y = model(LogicArray(data, Range(3, 'downto', 0)));
        assert dut.y.value.binstr == y.binstr, f"HDL result incorrect: {dut.y.value.binstr} vs {y.binstr}"

