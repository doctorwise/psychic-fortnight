from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_7(dut):
    for aValue in range(1):
        dut.a.value = aValue;
        for bValue in range(1):
            dut.b.value = bValue;
            for cValue in range(1):
                dut.cin.value = cValue;
                await Timer(1, units="ns")
                s, cout = model(dut.a.value, dut.b.value, dut.cin.value);
                assert(dut.s.value == s, f"HDL result incorrect: {dut.s.value} vs {s}")
                assert(dut.cout.value == cout, f"HDL result incorrect: {dut.cout.value} vs {cout}")

