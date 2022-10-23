from model import *

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def testRAM(dut):

    writeEnable = Logic('1')
    writeDisable = Logic('0')
    addressToSet = LogicArray(12, Range(5, 'downto', 0))
    valueToSet = LogicArray( \
        '10010101101011010010011101101011', \
        Range(31, 'downto', 0) \
    )

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
  
    ram = RAM()

    await FallingEdge(dut.clk)

    dut.we.value = writeEnable
    dut.adr.value = addressToSet
    dut.din.value = valueToSet
    
    ram.write(writeEnable, addressToSet, valueToSet)

    await FallingEdge(dut.clk)
    assert LogicArray(dut.dout.value) == ram.read(addressToSet), "{dut.dout.value} vs. {ram.read(addressToSet)}"

    dut.we.value = writeDisable    
    dut.adr.value = addressToSet
    dut.din.value = LogicArray(0, Range(31, 'downto', 0))
    
    ram.write(writeDisable, addressToSet, valueToSet)

    await FallingEdge(dut.clk)
    assert LogicArray(dut.dout.value) == ram.read(addressToSet), "{dut.dout.value} vs. {ram.read(addressToSet)}"
