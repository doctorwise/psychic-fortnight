from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

@cocotb.test()
async def test4_36(dut):
    for idx in range(2**4):
        dut.a.value = idx
        # note that this logic has some delays in it
        await Timer(5, units="ns")
        y = model( \
            LogicArray(idx, Range(3, 'downto', 0)) \
        )
        assert bool(dut.y.value) == bool(y), f"HDL result incorrect: {bool(dut.y.value)} vs {bool(y)}"
