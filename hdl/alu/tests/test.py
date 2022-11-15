import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

from random import randrange

@cocotb.test()
async def test_alu(dut):

    aValues = [ \
        LogicArray(12, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0xffffffff, Range(31, 'downto', 0)), \
        LogicArray(12, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0xffffffff, Range(31, 'downto', 0)), \
        LogicArray(12, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0xffffffff, Range(31, 'downto', 0)), \
        LogicArray(12, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0xffffffff, Range(31, 'downto', 0)), \
    ]

    bValues = [ \
        LogicArray(34, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0x00101001, Range(31, 'downto', 0)), \
        LogicArray(34, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0x00101001, Range(31, 'downto', 0)), \
        LogicArray(34, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0x00101001, Range(31, 'downto', 0)), \
        LogicArray(34, Range(31, 'downto', 0)), \
        LogicArray(0x7fffffff, Range(31, 'downto', 0)), \
        LogicArray(0x00101001, Range(31, 'downto', 0)), \
    ]

    alucontrolValues = [ \
        LogicArray("00", Range(1, 'downto', 0)), \
        LogicArray("00", Range(1, 'downto', 0)), \
        LogicArray("00", Range(1, 'downto', 0)), \
        LogicArray("01", Range(1, 'downto', 0)), \
        LogicArray("01", Range(1, 'downto', 0)), \
        LogicArray("01", Range(1, 'downto', 0)), \
        LogicArray("10", Range(1, 'downto', 0)), \
        LogicArray("10", Range(1, 'downto', 0)), \
        LogicArray("10", Range(1, 'downto', 0)), \
        LogicArray("11", Range(1, 'downto', 0)), \
        LogicArray("11", Range(1, 'downto', 0)), \
        LogicArray("11", Range(1, 'downto', 0)), \
    ]

    for idx in range(len(aValues)):

        a = aValues[idx]
        b = bValues[idx]
        alucontrol = alucontrolValues[idx]

        dut.a.value = a
        dut.b.value = b
        dut.alucontrol.value = alucontrol

        await Timer(5, units="ns")

        [result, aluflags] = model.alu(a, b, alucontrol)

        ref = LogicArray(result, Range(31, 'downto', 0))
        calc = LogicArray(dut.result.value, Range(31, 'downto', 0))

        assert ref == calc, f"Result: {calc} (HDL) vs. {ref} (model)"

        ref = LogicArray(aluflags, Range(3, 'downto', 0))
        calc = LogicArray(dut.aluflags.value, Range(3, 'downto', 0))

        assert ref == calc, f"ALUFlags: {calc} (HDL) vs. {ref} (model)"
