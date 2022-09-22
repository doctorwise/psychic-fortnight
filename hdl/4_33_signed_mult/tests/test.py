from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import LogicArray, Range

@cocotb.test()
async def test4_33(dut):

    for aVal in range(-(2**3), 2**3, 1):
        for bVal in range(-(2**3), 2**3, 1):
            dut.a.value = aVal
            dut.b.value = bVal 
            await Timer(1, units="ns")
            hdlResult = LogicArray(dut.y.value).signed_integer
            modelResult = model(a=dut.a.value, b=dut.b.value).signed_integer
            assert hdlResult == modelResult, \
                f"HDL and model disagree: {hdlResult} vs {modelResult}"

