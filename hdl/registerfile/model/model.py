from cocotb.types import Logic, LogicArray, Range

class registerfile:
    """register file"""
    def __init__(self):
        self.data = (15) * [LogicArray(0, Range(31, 'downto', 0))]
    def read(self, a: LogicArray, r15: LogicArray) -> LogicArray:
        if a.integer < 15:
            return self.data[a.integer]
        elif a.integer == 15:
            return r15
        else:
            raise Exception('only 16 registers')
    def write(self, we: Logic, a: LogicArray, wd: LogicArray):
        if we == True:
            if a.integer < 15:
                self.data[a.integer] = wd
            elif a.integer == 15:
                pass
            else:
                raise Exception('only 16 registers')
            
