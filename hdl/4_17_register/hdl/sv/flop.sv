module flop (
	input   logic       clk,
  input   logic [3:0] d,
  output  logic [3:0] q
);

  // there are also variants always, always_latch, etc., but 
  // always_ff is used to explicitly imply flip-flops and allows warnings
  // to be produced by our tools
  //
  // an always statement is of the form
  // 
  // <always directive> @(<sensitivity list>)
  //    <statement>;
  //
  always_ff @(posedge clk)
    // this is a non blocking assignment (used instead of assign inside an
    // always statement (pronounced "q gets d")
    q <= d;

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      clk,
      d,
      q
    );
    #5;
 end
 `endif

endmodule
