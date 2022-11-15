from cocotb.types import Logic, LogicArray, Range

class ram:
    """byte addressable, word accessible random access memory"""
    def __init__(self):
        self.data = (64) * [LogicArray(0, Range(31, 'downto', 0))]
    def read(self, a: LogicArray) -> LogicArray:
        return self.data[a[7:2].integer]
    def write(self, we: Logic, a: LogicArray, wd: LogicArray):
        if (bool(we) == True):
            self.data[a[7:2].integer] = wd
