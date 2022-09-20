from model import model

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test4_30(dut):

    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock

    await FallingEdge(dut.clk)  # Synchronize with the clock
    dut.reset.value = 1;
    await FallingEdge(dut.clk)  # Synchronize with the clock
    fsm = model();
    dut.reset.value = 0;
    await FallingEdge(dut.clk)  # Synchronize with the clock
    y = fsm.work(dut.clk, 0);
    assert dut.y.value == y, f"{dut.y.value} vs {y}"
    for iteration in range(3 * 10):
        await FallingEdge(dut.clk)
        y = fsm.work(dut.clk, 0);
        assert dut.y.value == y, f"{dut.y.value} vs {y}"
