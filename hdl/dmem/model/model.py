from cocotb.types import Logic, LogicArray, Range

class DMEM:
    def __init__(self):
        self.data = 64 * [LogicArray(0, Range(31, 'downto', 0))]
    def read(self, adr: LogicArray) -> LogicArray:
        maskedAddr = ((adr.integer & LogicArray('0000000000000000000000011111100').integer) >> 2)
        return self.data[maskedAddr]
    def write(self, we: Logic, adr: LogicArray, din: LogicArray):
        if (bool(we) == True):
            maskedAddr = ((adr.integer & LogicArray('0000000000000000000000011111100').integer) >> 2)
            self.data[maskedAddr] = din
