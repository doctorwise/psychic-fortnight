module priorityckt (
	input   logic [3:0] a,
  output  logic [3:0] y
);

// in SystemVerilog, if statements must always appear within always statements.
always_comb
  if      (a[3]) y = 4'b1000;
  else if (a[2]) y = 4'b0100;
  else if (a[1]) y = 4'b0010;
  else if (a[0]) y = 4'b0001;
  else           y = 4'b0000;

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      a,
      y
    );
    #5;
 end
`endif

endmodule
