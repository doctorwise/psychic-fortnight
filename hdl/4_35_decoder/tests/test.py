from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

@cocotb.test()
async def test4_35(dut):
    for idx in range(8):
        dut.a.value = idx
        # note that this logic has some delays in it
        await Timer(2, units="ns")
        y = model( \
            LogicArray(idx, Range(7, 'downto', 0)) \
        )
        assert dut.y.value.binstr.upper() == y.binstr.upper(), f"HDL result incorrect: {dut.y.value.binstr.upper()} vs {y.binstr.upper()}"
