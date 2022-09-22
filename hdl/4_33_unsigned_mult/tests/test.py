from model import model

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test4_33(dut):

    for aVal in range(2**4):
        for bVal in range(2**4):
            dut.a.value = aVal
            dut.b.value = bVal
            await Timer(1, units="ns")
            hdlResult = int(dut.y.value)
            modelResult = model(a=dut.a.value, b=dut.b.value).integer
            assert hdlResult == modelResult, \
                f"HDL and model disagree: {hdlResult} vs {modelResult}"

