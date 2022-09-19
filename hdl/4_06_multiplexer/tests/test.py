from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_6(dut):
    dut.d0.value = 1;
    dut.d1.value = 2;
    dut.d2.value = 3;
    dut.d3.value = 4;
    dut.s.value = 1;
    await Timer(1, units="ns")
    out = model(dut.s.value, dut.d0.value, dut.d1.value, dut.d2.value, dut.d3.value);
    assert(dut.y.value == out, f"HDL result incorrect: {dut.y.value} vs {out}")
    dut.s.value = 0;
    await Timer(1, units="ns")
    out = model(dut.s.value, dut.d0.value, dut.d1.value, dut.d2.value, dut.d3.value);
    assert(dut.y.value == out, f"HDL result incorrect: {dut.y.value} vs {out}")

