# Xilinx Block Ram Generator model for Cocotb

This extension a **simple** model for the [Xilinx Memory Generator](https://www.xilinx.com/support/documentation/ip_documentation/blk_mem_gen/v8_4/pg058-blk-mem-gen.pdf) when set with _Interface Type_ **AXI4** and _Memory Type_ **Simple Dual Port RAM**. That will
enable a second port (Port B) where you can read from memory.

## Signal mappings to model

Refer to the **Port B** signals [here](https://www.xilinx.com/support/documentation/ip_documentation/blk_mem_gen/v8_4/pg058-blk-mem-gen.pdf#G5.291182)

| Port B signal |  Model instance attribute |
|---------------|---------------------------|
| addrb         | _instance_.portb.addr     |
| doutb         | _instance_.portb.dout     |
| dinb          | _instance_.portb.din      |
| enb           | _instance_.portb.en       |
| web           | _instance_.portb.we       |

**NOTE**: This model is not complete. Currently it supports only writing content using AXI4, and reading from _instance_.portb.dout