module mux4 (
	input   logic [3:0] d0, d1, d2, d3,
  input   logic [1:0] s,
  output  logic [3:0] y
);

logic [3:0] low, high;

mux2 lowmux (
  d0, d1,
  s[0],
  low
);

mux2 highmux (
  d2, d3,
  s[0],
  high
);

mux2 finalmux (
  low, high,
  s[1],
  y
);

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      d0, d1, d2, d3,
      s,
      low, high,
      y
    );
    #5;
 end
 `endif

endmodule
