from model import *

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test4_31(dut):

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
    
    fsm = ModeFSM();

    await FallingEdge(dut.clk)  # Synchronize with the clock
    # simulate reset
    dut.reset.value = 1;
    dut.p.value = 0;
    dut.r.value = 0;
    fsm.reset()

    # are these test cases exhaustive? (nope... probably should be)
    pValues = [0, 1, 1, 0]
    rValues = [1, 0, 0, 1]

    for pVal in pValues:
        for rVal in rValues:
            await FallingEdge(dut.clk)  # Synchronize with the clock
            # check state
            if (dut.reset.value == 1):
                fsm.reset()
            else:
                fsm.transitionToNextState(dut.p.value, dut.r.value)
            assert dut.m.value == fsm.output(), f"{dut.m.value} vs {fsm.output()}"

            # assign new values before next rising edge 
            dut.reset.value = 0;
            dut.p.value = pVal;
            dut.r.value = rVal;
    
    await FallingEdge(dut.clk)  # Synchronize with the clock
    
    # check state
    fsm.transitionToNextState(dut.p.value, dut.r.value)
    assert dut.m.value == fsm.output(), f"{dut.m.value} vs {fsm.output()}"
