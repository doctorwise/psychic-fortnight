from model import *

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def testRAM(dut):

    writeEnable = Logic('1')
    writeDisable = Logic('0')
    addressToSet = LogicArray(\
        '11110101',\
        Range(7, 'downto', 0)\
    )
    valueToSet = LogicArray( \
        '10010101101011010010011101101011', \
        Range(31, 'downto', 0) \
    )

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
  
    dmem = DMEM()

    await FallingEdge(dut.clk)

    dut.we.value = writeEnable
    dut.a.value = addressToSet
    dut.wd.value = valueToSet
    
    dmem.write(writeEnable, addressToSet, valueToSet)

    await FallingEdge(dut.clk)
    assert LogicArray(dut.rd.value) == dmem.read(addressToSet), "{dut.rd.value} vs. {dmem.read(addressToSet)}"

    dut.we.value = writeDisable    
    dut.a.value = addressToSet
    dut.wd.value = LogicArray(0, Range(31, 'downto', 0))
    
    dmem.write(writeDisable, addressToSet, valueToSet)

    await FallingEdge(dut.clk)
    assert LogicArray(dut.rd.value) == dmem.read(addressToSet), "{dut.rd.value} vs. {dmem.read(addressToSet)}"
