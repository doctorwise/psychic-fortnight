from cocotb.types import Logic, LogicArray, Range

class RAM:
    """ModeFSM of mode FSM from Figure 3.34"""
    def __init__(self, N = 6, M = 32):
        self.data = (2**N - 1) * [LogicArray(0, Range(M - 1, 'downto', 0))]
    def read(self, adr: LogicArray) -> LogicArray:
        print(f"reading {adr.integer}")
        return self.data[adr.integer]
    def write(self, we: Logic, adr: LogicArray, din: LogicArray):
        print(f"from write: {we}")
        if (bool(we) == True):
            print(f"reading {adr.integer}")
            self.data[adr.integer] = din
