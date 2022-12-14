from model import model

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test4_17(dut):

    """Test that d propagates to q"""

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock

    await FallingEdge(dut.clk)  # Synchronize with the clock
    for val in range(2**4):
        for reset in range(2):
            dut.d.value = val  # Assign the random value val to the input port d
            dut.reset.value = reset  # Assign the value for reset
            await FallingEdge(dut.clk)
            assert dut.q.value == (val if not reset else 0), f"output q was incorrect on the {i}th cycle"
