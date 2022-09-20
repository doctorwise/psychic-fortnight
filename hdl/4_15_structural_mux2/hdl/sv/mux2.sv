module mux2 (
	input   logic [3:0] d0, d1,
  input   logic       s,
  output  tri   [3:0] y
);

tristate t0 (
  d0, ~s, y
);

tristate t1 (
  d1, s, y
);

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      d0, d1,
      s,
      y
    );
    #5;
 end
 `endif

endmodule
