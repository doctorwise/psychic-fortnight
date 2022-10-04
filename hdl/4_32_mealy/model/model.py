from cocotb.types import Logic, LogicArray, Range

class model:
    """model of 4_28 priority circuit"""
    def __init__(self):
        self.state = 0
    def reset(self) -> Logic:
        self.state = 0
    def transitionToNextState(self, a):
        if a == True:
            self.state = 0
        else:
            self.state = 1
    def output(self, a):
        return int(a == 1 and self.state == 1)
