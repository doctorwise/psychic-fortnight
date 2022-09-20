// gives a timescale in the form unit size / precision size
// default is 1 ns for both
`timescale 1ns/1ps

module example (
	input   logic a, b, c,
  output  logic y
);

  logic ab, bb, cb, n1, n2, n3;

  // the number after # indicates the number of units of delay
  assign #1 {ab, bb, cb} = ~{a, b, c};
  assign #2 n1 = ab & bb & cb;
  assign #2 n2 = a & bb & cb;
  assign #2 n3 = a & bb & c;
  assign #4 y = n1 | n2 | n3;

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(0,a,b,c,ab,bb,cb,n1,n2,n3,y);
    #5;
 end
 `endif

endmodule
