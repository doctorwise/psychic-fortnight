from model import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import LogicArray, Range

@cocotb.test()
async def test4_14(dut):
    for d0Val in range(2**4):
        for d1Val in range(2**4):
            for d2Val in range(2**4):
                for d3Val in range(2**4):
                    for sVal in range(2**2):
                        dut.d0.value = d0Val
                        dut.d1.value = d1Val
                        dut.d2.value = d2Val
                        dut.d3.value = d3Val
                        dut.s.value = sVal
                        # note that this logic has some delays in it
                        await Timer(2, units="ns")
                        y = model( \
                            d0=LogicArray(d0Val, Range(3, 'downto', 0)), \
                            d1=LogicArray(d1Val, Range(3, 'downto', 0)), \
                            d2=LogicArray(d2Val, Range(3, 'downto', 0)), \
                            d3=LogicArray(d3Val, Range(3, 'downto', 0)), \
                            s=LogicArray(sVal, Range(1, 'downto', 0)) \
                        )
                        assert dut.y.value.binstr.upper() == y.binstr.upper(), f"HDL result incorrect: {dut.y.value.binstr.upper()} vs {y.binstr.upper()}"
