from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

import random
from random import *

@cocotb.test()
async def test4_14(dut):
    for iteration in range(4):
        dut.d0.value = 1;
        dut.d1.value = 2;
        dut.d2.value = 3;
        dut.d3.value = 4;
        dut.s.value = iteration;
        # note that this logic has some delays in it
        await Timer(2, units="ns")
        y = model(dut.d0.value, dut.d1.value, dut.d2.value, dut.d3.value, LogicArray(iteration, Range(1, 'downto', 0)))
        assert dut.y.value.binstr.upper() == y.binstr.upper(), f"HDL result incorrect: {dut.y.value.binstr.upper()} vs {y.binstr.upper()}"
