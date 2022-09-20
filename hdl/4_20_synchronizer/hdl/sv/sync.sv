module sync (
	input   logic clk,
  input   logic d,
  output  logic q
);

  logic n1;

  always_ff @(posedge clk)
    begin // to handle multiple statements
      n1 <= d; // nonblocking
      q <= n1; // nonblocking
    end

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      clk,
      n1,
      d,
      q
    );
    #5;
 end
 `endif

endmodule
