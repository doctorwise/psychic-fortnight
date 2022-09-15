from typing import Tuple

def model(s: int, a: int, b: int, c: int, d: int) -> int:
    """model of 4_6 multiplexer"""
    if s == 0:
        return a
    elif s == 1:
        return b
    elif s == 2:
        return c
    elif s == 3:
        return d
    else:
        raise Exception("unsupported case")
