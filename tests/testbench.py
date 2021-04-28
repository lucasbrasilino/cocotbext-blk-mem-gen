import cocotb
from cocotb.triggers import RisingEdge, FallingEdge
from cocotbext.axi import AxiBus
from cocotbext.blk_mem_gen import BlkMemGen


@cocotb.test()
async def test(dut):
    
    rank2ip = BlkMemGen(AxiBus.from_prefix(dut,"m_axi"),dut.aclk,dut.areset,size=2**16)

    rank2ip.portb.en = 1
    rank2ip.portb.addr = 4
    cocotb.log.info("*** rank2ip.dout = %s" % rank2ip.portb.dout.hex())
    rank2ip.write_dword(4,0xc0caff01,byteorder='little')
    rank2ip.portb.addr = 4
    cocotb.log.info("*** rank2ip.dout = %s" % rank2ip.portb.dout.hex())
   
    cocotb.log.info("*** port disabled")
    rank2ip.portb.en = 0
    rank2ip.write_dword(8,0xcfffbbaa,byteorder='little')
    rank2ip.portb.addr = 8
    cocotb.log.info("*** rank2ip.dout = %s" % rank2ip.portb.dout.hex())
    rank2ip.portb.addr = 4
    cocotb.log.info("*** rank2ip.dout = %s" % rank2ip.portb.dout.hex())
    cocotb.log.info("*** port enabled")
    rank2ip.portb.en = 1
    rank2ip.portb.addr = 8
    cocotb.log.info("*** rank2ip.dout = %s" % rank2ip.portb.dout.hex())
    rank2ip.portb.addr = 4
    cocotb.log.info("*** rank2ip.dout = %s" % rank2ip.portb.dout.hex())
  