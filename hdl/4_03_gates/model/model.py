from typing import Tuple

def model(a: bool, b: bool) -> Tuple[bool, bool, bool, bool, bool]:
    """model of 4_3 gates"""
    return a and b, a or b, a != b, not (a and b), not (a or b);
