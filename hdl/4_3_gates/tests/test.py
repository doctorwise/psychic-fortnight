from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_3(dut):
    for bitIdx in range(3):
        for a_val in range(1):
            dut.a.value = a_val
            for b_val in range(1):
                dut.b.value = b_val
                await Timer(1, units="ns")
                y1, y2, y3, y4, y5 = model(a_val, b_val)
                assert dut.y1.value[bitIdx] == y1, f"HDL result incorrect: {dut.y1.value[bitIdx]} vs {y1}"
                assert dut.y2.value[bitIdx] == y2, f"HDL result incorrect: {dut.y2.value[bitIdx]} vs {y2}"
                assert dut.y3.value[bitIdx] == y3, f"HDL result incorrect: {dut.y3.value[bitIdx]} vs {y3}"
                assert dut.y4.value[bitIdx] == y4, f"HDL result incorrect: {dut.y4.value[bitIdx]} vs {y4}"
                assert dut.y5.value[bitIdx] == y5, f"HDL result incorrect: {dut.y5.value[bitIdx]} vs {y5}"
