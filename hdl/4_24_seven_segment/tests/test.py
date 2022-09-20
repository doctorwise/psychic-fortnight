from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_24(dut):
    for data in range(2**4):
        dut.data.value = data
        await Timer(1, units="ns")
        segments = model(dut.data.value);
        assert dut.segments.value.binstr == segments.binstr, f"HDL result incorrect: {dut.segments.value.binstr} vs {segments.binstr}"

