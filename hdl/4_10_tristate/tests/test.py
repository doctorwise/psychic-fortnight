from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import LogicArray

@cocotb.test()
async def test4_10(dut):

    dut.a.value = LogicArray("1111");
    for enValue in range(1):
        dut.en.value = enValue;
        await Timer(1, units="ns")
        y = model(dut.a.value, dut.en.value);
        assert(dut.y.value.binstr == y.binstr, f"HDL result incorrect: {dut.y.value.binstr} vs {y.binstr}")

