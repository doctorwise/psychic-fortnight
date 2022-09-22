from model import model

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge
from random import *

@cocotb.test()
async def test4_32(dut):

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
    
    fsm = model();

    await FallingEdge(dut.clk)  # Synchronize with the clock
    # simulate reset
    dut.reset.value = 1;
    fsm.reset()
    dut.a.value = randrange(2);

    await FallingEdge(dut.clk)  # Synchronize with the clock
    # check reset
    y = fsm.output(dut.a.value)
    assert dut.y.value == y, f"{dut.y.value} vs {y}"
    # Go out of reset immediately 
    dut.reset.value = 0;
    dut.a.value = randrange(2);
    
    await FallingEdge(dut.clk)  
    
    for iteration in range(3 * 10):

        await FallingEdge(dut.clk)

        # check the output value based on what was done on the previous posedge
        fsm.transitionToNextState(dut.a.value)
        y = fsm.output(dut.a.value)
        assert dut.y.value == y, f"{dut.y.value} vs {y}"

        # change the input value so it will take effect before the next
        # rising edge
        dut.a.value = randrange(2);
