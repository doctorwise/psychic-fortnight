from model import model

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test4_17(dut):

    """Test that d propagates to q"""

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock

    dut.d.value = 1;
    lastValue = dut.d.value;
    await FallingEdge(dut.clk)  # Synchronize with the clock
    await FallingEdge(dut.clk)  # Synchronize with the clock
    
    for fullVal in range(10):
        val = (fullVal % 2);
        dut.d.value = val  # Assign the random value val to the input port d
        lastValue = dut.d.value;
        await FallingEdge(dut.clk)
        assert dut.q.value == lastValue, f"HDL output {dut.q.value} vs {lastValue}"
