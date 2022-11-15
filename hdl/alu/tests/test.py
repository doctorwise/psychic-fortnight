import model

import cocotb
from cocotb.triggers import Timer
from cocotb.types import Logic, LogicArray, Range

from random import randrange

@cocotb.test()
async def test_alu(dut):

    # case 1: nonpathological addition

    a = LogicArray(12, Range(31, 'downto', 0))
    b = LogicArray(34, Range(31, 'downto', 0))
    alucontrol = LogicArray("00", Range(1, 'downto', 0))

    dut.a.value = a
    dut.b.value = b
    dut.alucontrol.value = alucontrol

    await Timer(5, units="ns")

    [result, aluflags] = model.alu(a, b, alucontrol)

    print(f"{result}, {aluflags}")

    print(f"{dut.result.value}, {dut.aluflags.value}")

    ref = LogicArray(result, Range(31, 'downto', 0))
    calc = LogicArray(dut.result.value, Range(31, 'downto', 0))

    assert ref == calc, f"Result: {calc} (HDL) vs. {ref} (model)"

    ref = LogicArray(aluflags, Range(3, 'downto', 0))
    calc = LogicArray(dut.aluflags.value, Range(3, 'downto', 0))

    assert ref == calc, f"ALUFlags: {calc} (HDL) vs. {ref} (model)"
    
    # case 1: overflowing addition

    a = LogicArray(0xffffffff, Range(31, 'downto', 0))
    b = LogicArray(0xffffffff, Range(31, 'downto', 0))
    alucontrol = LogicArray("01", Range(1, 'downto', 0))

    dut.a.value = a
    dut.b.value = b
    dut.alucontrol.value = alucontrol

    await Timer(5, units="ns")

    [result, aluflags] = model.alu(a, b, alucontrol)

    print(f"{result}, {aluflags}")

    print(f"{dut.result.value}, {dut.aluflags.value}")

    ref = LogicArray(result, Range(31, 'downto', 0))
    calc = LogicArray(dut.result.value, Range(31, 'downto', 0))

    assert ref == calc, f"Result: {calc} (HDL) vs. {ref} (model)"

    ref = LogicArray(aluflags, Range(3, 'downto', 0))
    calc = LogicArray(dut.aluflags.value, Range(3, 'downto', 0))

    assert ref == calc, f"ALUFlags: {calc} (HDL) vs. {ref} (model)"

    """
    for numIter in range(10):
        instr = LogicArray(randrange(2**31), Range(31, ''downto'', 0))
        print(f'{instr}')
        dut.instr.value = instr
        
        for immsrc in range(3):
            dut.immsrc.value = LogicArray(immsrc, Range(1, ''downto'', 0))
            await Timer(1, units="ns")
            assert LogicArray(dut.extimm.value, Range(31, ''downto'', 0)) == LogicArray(model(dut.immsrc.value, dut.instr.value), Range(31, ''downto'', 0)), \
                f"{instr}, {immsrc}: {dut.extimm.value} vs {model(dut.immsrc.value, dut.instr.value)}"
    """
