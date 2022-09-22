from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

import random
from random import *

@cocotb.test()
async def test4_15(dut):
    numIter = 3;
    for iteration in range(numIter):
        dut.d0.value = randrange(2**8)
        dut.d1.value = randrange(2**8)
        dut.s.value = randrange(2)
        # note that this logic has some delays in it
        await Timer(2, units="ns")
        y = model( \
            dut.d0.value, \
            dut.d1.value, \
            dut.s.value \
        )
        assert dut.y.value.binstr.upper() == y.binstr.upper(), f"HDL result incorrect: {dut.y.value.binstr.upper()} vs {y.binstr.upper()}"
