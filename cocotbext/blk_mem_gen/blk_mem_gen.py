import cocotb
from cocotbext.axi import AxiRam,AxiBus

from .version import __version__

class BlkMemGenPort(object):

    def __init__(self,blkmem):
        self.en = 0
        self.we = 0
        self.__mem = blkmem
        self.addr = 0
        self.dout = 0
        self.dint = 0
        
    def __setattr__(self,name,value):
        self.__dict__[name] = value        
        if name == 'addr':
            if self.en:
                self.dout = self.__mem.read(value,4)

class BlkMemGen(AxiRam):

    def __init__(self,bus,clock, reset_active_level=True, size=1024, mem=None, *args, **kwargs):
        super().__init__(bus, clock, reset_active_level=True, size=1024, mem=None, *args, **kwargs)
        self.portb = BlkMemGenPort(self)