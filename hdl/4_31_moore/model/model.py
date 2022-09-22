from cocotb.types import Logic, LogicArray, Range

class model:
    """model of 4_28 priority circuit"""
    def __init__(self):
        self.state = 0
    def reset(self) -> Logic:
        self.state = 0
    def transitionToNextState(self, a):
        if a == True:
            if self.state == 0:
                self.state = 0
            elif self.state == 1:
                self.state = 2
            elif self.state == 2:
                self.state = 0
        else:
            if self.state == 0:
                self.state = 1
            elif self.state == 1:
                self.state = 1
            elif self.state == 2:
                self.state = 1
    def output(self):
        return int(self.state == 2)
