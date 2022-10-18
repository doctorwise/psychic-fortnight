from cocotb.types import Logic, LogicArray, Range

class LightsFSM:
    """LightsFSM of mode FSM from Figure 3.34"""
    def __init__(self):
        self.state = 0
    def reset(self) -> Logic:
        self.state = 0
    def transitionToNextState(self, ta, tb, m):
        if self.state == 0:
            if ta == 0:
                self.state = 1
            elif ta == 1:
                self.state = 0
        elif self.state == 1:
            self.state = 2
        elif self.state == 2:
            if m == 1 or tb == 1:
                self.state = 2
            elif m == 0 and tb == 0:
                self.state = 3
        elif self.state == 3:
            self.state = 0
    def output(self):
        # we use a one hot encoding here for each of the lights
        # 2 - red
        # 1 - yellow
        # 0 - green

        red = LogicArray('100', Range(2, 'downto', 0))
        yellow = LogicArray('010', Range(2, 'downto', 0))
        green = LogicArray('001', Range(2, 'downto', 0))

        if self.state == 0:
            return [green, red]
        elif self.state == 1:
            return [yellow, red]
        elif self.state == 2:
            return [red, green]
        elif self.state == 3:
            return [red, yellow]
        else: # error state
            return [red, red]
