module flopr (
	input   logic       clk,
  input   logic       reset,
  input   logic [3:0] d,
  output  logic [3:0] q
);

  always_ff @(posedge clk)
    if (reset) q <= 4'b0;
    else q <= d;

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      clk,
      reset,
      d,
      q
    );
    #5;
 end
 `endif

endmodule
