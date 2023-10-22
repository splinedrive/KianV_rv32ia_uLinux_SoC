# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# normal simulation
ifneq ($(GATES),yes)

# this is the only part you should need to modify:
VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/tt_um_kianV_rv32ia_uLinux_SoC.v # $(PWD)/decoder.v
VERILOG_SOURCES += $(PWD)/tx_uart.v
VERILOG_SOURCES += $(PWD)/clint.v
VERILOG_SOURCES += $(PWD)/rx_uart.v
VERILOG_SOURCES += $(PWD)/qqspi.v
VERILOG_SOURCES += $(PWD)/soc.v
VERILOG_SOURCES += $(PWD)/fifo.v
VERILOG_SOURCES += $(PWD)/riscv_defines.vh
VERILOG_SOURCES += $(PWD)/csr_decoder.v
VERILOG_SOURCES += $(PWD)/misa.vh
VERILOG_SOURCES += $(PWD)/alu_decoder.v
VERILOG_SOURCES += $(PWD)/register_file.v
VERILOG_SOURCES += $(PWD)/design_elements.v
VERILOG_SOURCES += $(PWD)/riscv_defines.vh
VERILOG_SOURCES += $(PWD)/main_fsm.v
VERILOG_SOURCES += $(PWD)/csr_exception_handler.v
VERILOG_SOURCES += $(PWD)/control_unit.v
VERILOG_SOURCES += $(PWD)/store_decoder.v
VERILOG_SOURCES += $(PWD)/datapath_unit.v
VERILOG_SOURCES += $(PWD)/csr_utilities.vh
VERILOG_SOURCES += $(PWD)/riscv_priv_csr_status.vh
VERILOG_SOURCES += $(PWD)/load_decoder.v
VERILOG_SOURCES += $(PWD)/extend.v
VERILOG_SOURCES += $(PWD)/rv32_amo_opcodes.vh
VERILOG_SOURCES += $(PWD)/load_alignment.v
VERILOG_SOURCES += $(PWD)/mcause.vh
VERILOG_SOURCES += $(PWD)/kianv_harris_mc_edition.v
VERILOG_SOURCES += $(PWD)/alu.v
VERILOG_SOURCES += $(PWD)/store_alignment.v
VERILOG_SOURCES += $(PWD)/defines_soc.vh

else

# gate level simulation requires some extra setup, you shouldn't need to touch this
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/gate_level_netlist.v
endif

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
