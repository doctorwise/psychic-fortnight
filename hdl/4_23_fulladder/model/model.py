from typing import Tuple

def model(a: bool, b: bool, cin: bool) -> Tuple[bool, bool]:
    """model of 4_7 fulladder"""
    p = a ^ b;
    g = a & b;

    s = p ^ cin;
    cout = g | (p & cin);

    return s, cout;
