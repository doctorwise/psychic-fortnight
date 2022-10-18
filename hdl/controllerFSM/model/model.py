from typing import Tuple
from cocotb.types import LogicArray, Logic
import mode.model
import lights.model

class ControllerFSM:
    """ControllerFSM from factored FSMs from Figure 3.33"""
    def __init__(self):
        self.modeFSM = mode.model.ModeFSM()
        self.lightsFSM = lights.model.LightsFSM()
    def reset(self) -> Logic:
        self.modeFSM.reset()
        self.lightsFSM.reset()
    def transitionToNextState(self, p, r, ta, tb):
        self.lightsFSM.transitionToNextState(ta, tb, self.modeFSM.output())
        self.modeFSM.transitionToNextState(p, r)
    def output(self):
        return self.lightsFSM.output()
