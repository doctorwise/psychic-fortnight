from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_4(dut):
    dut.a.value = 0
    await Timer(1, units="ns")
    for bitValue in range(2**8):
        dut.a.value = bitValue 
        await Timer(1, units="ns")
        y = model(dut.a.value[0], dut.a.value[1], dut.a.value[2], dut.a.value[3], dut.a.value[4], dut.a.value[5], dut.a.value[6], dut.a.value[7])
        assert dut.y.value == y, f"HDL result incorrect: {dut.y.value} vs {y}"
