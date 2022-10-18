from model import *

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test4_31(dut):

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
    
    fsm = LightsFSM();

    await FallingEdge(dut.clk)  # Synchronize with the clock
    # simulate reset
    dut.reset.value = 1;
    dut.ta.value = 0;
    dut.tb.value = 0;
    dut.m.value = 0;

    # are these test cases exhaustive? nope... probably should be :)
    taValues = [0, 1, 1, 0]
    tbValues = [1, 0, 0, 1]
    mValues = [1, 0, 0, 1]

    for taVal in taValues:
        for tbVal in tbValues:
            for mVal in mValues:

                await FallingEdge(dut.clk)  # Synchronize with the clock
                # check state
                if (dut.reset.value == 1):
                    fsm.reset()
                else:
                    fsm.transitionToNextState(dut.ta.value, dut.tb.value, dut.m.value)

                assert LogicArray(dut.la.value, Range(2, 'downto', 0)) == fsm.output()[0], f"{LogicArray(dut.la.value, Range(2, 'downto', 0))} vs {fsm.output()[0]}"
                assert LogicArray(dut.lb.value, Range(2, 'downto', 0)) == fsm.output()[1], f"{LogicArray(dut.lb.value, Range(2, 'downto', 0))} vs {fsm.output()[1]}"

                # assign new values before next rising edge 
                dut.reset.value = 0;
                dut.ta.value = taVal;
                dut.tb.value = tbVal;
                dut.m.value = mVal;
    
    await FallingEdge(dut.clk)  # Synchronize with the clock
    
    # check state
    fsm.transitionToNextState(dut.ta.value, dut.tb.value, dut.m.value)
    assert LogicArray(dut.la.value, Range(2, 'downto', 0)) == fsm.output()[0], f"{LogicArray(dut.la.value, Range(2, 'downto', 0))} vs {fsm.output()[0]}"
    assert LogicArray(dut.lb.value, Range(2, 'downto', 0)) == fsm.output()[1], f"{LogicArray(dut.lb.value, Range(2, 'downto', 0))} vs {fsm.output()[1]}"
