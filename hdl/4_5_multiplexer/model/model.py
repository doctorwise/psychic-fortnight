from typing import Tuple

def model(s: bool, a: int, b: int) -> int:
    """model of 4_5 multiplexer"""
    return b if s else a;
