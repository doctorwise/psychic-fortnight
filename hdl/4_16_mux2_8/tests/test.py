from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

@cocotb.test()
async def test4_16(dut):
    for d0Val in range(2**8):
        for d1Val in range(2**8):
            for sVal in range(2):
               dut.d0.value = d0Val
               dut.d1.value = d1Val
               dut.s.value = sVal
               # note that this logic has some delays in it
               await Timer(2, units="ns")
               y = model( \
                   d0=LogicArray(d0Val, Range(7, 'downto', 0)), \
                   d1=LogicArray(d1Val, Range(7, 'downto', 0)), \
                   s=Logic(sVal) \
               )
               assert dut.y.value.binstr.upper() == y.binstr.upper(), f"HDL result incorrect: {dut.y.value.binstr.upper()} vs {y.binstr.upper()}"
