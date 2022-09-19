module sillyfunction(
	input   logic a, b, c,
	output  logic y
);

  // this is a continuous assignment statement, ends with a semicolon,
  // and output changes in direct response to inputs
  assign y = ~a & ~b & ~c |
    a & ~b & ~c |
    a & ~b & c;

endmodule
