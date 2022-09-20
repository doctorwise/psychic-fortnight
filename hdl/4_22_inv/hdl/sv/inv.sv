module inv (

  input   logic [3:0] a,  // represents a 4-bit bus (little-endian order,
                          // where the least significant bit has the smallest 
                          // bit number

  output  logic [3:0] y   // represents a 4-bit bus (little endian order)

);

  // always_comb reevaluates any time and right hand side signals change
  // in either <= (nonblocking) or = (blocking) assignments
  //
  // Remember, blocking assignments are executed in the order they appear;
  // nonblocking assignments are evaluated concurrently / all statements are
  // evaluated before any of the left hand sides are updated.
  always_comb
    y = ~a;

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
