from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic

@cocotb.test()
async def test4_13(dut):

    for aVal in range(2):
        for bVal in range(2):
            for cVal in range(2):
                dut.a.value = (aVal)
                dut.b.value = (bVal)
                dut.c.value = (cVal)
                # note that this logic has some delays in it
                await Timer(10, units="ns")
                y = model(a=Logic(aVal), b=Logic(bVal), c=Logic(cVal))
                assert str(dut.y.value) == str(y), f"HDL result incorrect: {dut.y.value} vs {y}"
