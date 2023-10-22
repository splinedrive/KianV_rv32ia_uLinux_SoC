import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


@cocotb.test()
async def ttt_um_kianV_rv32ia_uLinux_SoC(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10);
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 10);


    assert 1 == 1
