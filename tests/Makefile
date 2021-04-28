export COCOTB_REDUCED_LOG_FMT ?= 1
TOPLEVEL=top_wrapper
VERILOG_SOURCES = ./$(TOPLEVEL).v

VERILOG_INCLUDES = .

NPROC = ${shell nproc}

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file:
# MODULE is the name of the Python test file:
MODULE=testbench
VERILATOR=verilator

SIM ?= verilator

ifeq ($(SIM),verilator)
  EXTRA_ARGS += --trace --trace-structs -Wno-fatal -j $(NPROC) -I$(VERILOG_INCLUDES)
  #EXTRA_ARGS +=  -G$(VERILATOR_PARAMETER)
endif

ifeq ($(LINT),all)
	LINT_EXTRA_ARGS = -Wall
endif	

ifeq ($(SIM),icarus)
	COMPILE_ARGS += -g2012 -I$(VERILOG_INCLUDES) 
endif

lint:
	$(VERILATOR) --lint-only -G$(VERILATOR_PARAMETER) -Wno-fatal $(LINT_EXTRA_ARGS) -I$(VERILOG_INCLUDES) --top-module $(TOPLEVEL) $(VERILOG_SOURCES)


include $(shell cocotb-config --makefiles)/Makefile.sim
