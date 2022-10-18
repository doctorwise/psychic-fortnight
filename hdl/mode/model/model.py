from cocotb.types import Logic, LogicArray, Range

class ModeFSM:
    """ModeFSM of mode FSM from Figure 3.34"""
    def __init__(self):
        self.state = 0
    def reset(self) -> Logic:
        self.state = 0
    def transitionToNextState(self, p, r):
        if self.state == 0:
            if p == 1:
                self.state = 1
        elif self.state == 1:
            if r == 1:
                self.state = 0
    def output(self):
        return int(self.state == 1)
