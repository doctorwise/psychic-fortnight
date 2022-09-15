def model(a: bool, b: bool, c: bool) -> bool:
    """model of 4_1 sillyfunction"""
    return (not a and not b and not c) or (a and not b and not c) or (a and not b and c);
