import model

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.triggers import FallingEdge
from cocotb.types import Logic, LogicArray, Range

@cocotb.test()
async def testRAM(dut):

    enable = 1
    disable = 0
    zero = LogicArray(0, Range(31, 'downto', 0))

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
  
    ram = model.ram()

    # initialize ram to zeros, writing a single value on each clock
    for idx in range(64): 
        await FallingEdge(dut.clk)
        
        addressToSet = LogicArray(idx, Range(31, 'downto', 0))
        valueToSet = zero;

        dut.we.value = enable
        dut.a.value = addressToSet
        dut.wd.value = valueToSet
        ram.write(enable, addressToSet, valueToSet)

    # disable writes
    await FallingEdge(dut.clk)
    dut.we.value = disable
    
    # note that reads are not clock synchronous
    await FallingEdge(dut.clk)
    # check ram is uniformly filled with zeros
    for idx in range(64): 
        addressToRead = LogicArray(idx, Range(31, 'downto', 0))
        dut.a.value = addressToSet
        await Timer(1, units="ns")
        readValue = LogicArray(dut.rd.value, Range(31, 'downto', 0))
        refReadValue = ram.read(addressToRead)
        assert readValue == refReadValue, 'ERROR: {readValue} vs {refReadValue}'

