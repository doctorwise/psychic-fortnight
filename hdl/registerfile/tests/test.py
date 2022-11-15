import model

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.triggers import FallingEdge
from cocotb.types import Logic, LogicArray, Range

@cocotb.test()
async def test_registerfile(dut):

    zeroAddress = LogicArray(0, Range(3, 'downto', 0))
    zeroValue = LogicArray(0, Range(31, 'downto', 0))
    
    dut.ra1.value = zeroAddress
    dut.ra2.value = zeroAddress
    dut.wa3.value = zeroAddress
    dut.wd3.value = zeroValue
    dut.we3.value = 0
    dut.r15.value = zeroValue

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
  
    registerfile = model.registerfile()

    for idx in range(16):

        await FallingEdge(dut.clk)

        if (idx == 15):
            dut.r15.value = LogicArray(100 + idx, Range(31, 'downto', 0))

        dut.wa3.value = LogicArray(idx, Range(3, 'downto', 0))
        dut.wd3.value = LogicArray(15 - idx, Range(31, 'downto', 0))
        dut.we3.value = 1

        await FallingEdge(dut.clk)
        
        registerfile.write(dut.we3.value, dut.wa3.value, dut.wd3.value) 

        dut.ra1.value = dut.wa3.value
        refReadData = registerfile.read(dut.wa3.value, dut.r15.value)
        
        await Timer(1, units="ns")

        assert dut.rd1.value == refReadData, (f"{dut.rd1.value} vs {refReadData}")
        
    await FallingEdge(dut.clk)

    for idx in range(16):
        dut.ra1.value = LogicArray(idx, Range(31, 'downto', 0))
        dut.ra2.value = LogicArray(idx, Range(31, 'downto', 0))
        
        await FallingEdge(dut.clk)

        refReadData = registerfile.read(dut.ra1.value, dut.r15.value)
        assert dut.rd1.value == refReadData, (f"{dut.rd1.value} vs {refReadData}")
        refReadData = registerfile.read(dut.ra2.value, dut.r15.value)
        assert dut.rd2.value == refReadData, (f"{dut.rd2.value} vs {refReadData}")
        
        print(f"{dut.rd1.value} vs {refReadData}")
        print(f"{dut.rd2.value} vs {refReadData}")
