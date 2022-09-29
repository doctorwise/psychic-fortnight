module inv (

  input   logic [3:0] a,  // represents a 4-bit bus (little-endian order,
                          // where the least significant bit has the smallest 
                          // bit number

  output  logic [3:0] y   // represents a 4-bit bus (little endian order)

);

  assign y = ~a;

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
