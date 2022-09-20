from cocotb.types import Logic, LogicArray, Range

class model:
    """model of 4_28 priority circuit"""
    def __init__(self):
        self.state = 0
    def work(self, clk: Logic, reset: Logic) -> Logic:
        
        if reset:
            self.state = 0
        else:
            self.state = (self.state + 1) % 3
        
        ret = (self.state == 0);


        return ret;
