// here we declare parameters with the following syntax:
//
//  #(parameter <name> [= <default value>])
//
module decoder #(parameter N = 3) (
  input   logic [N-1:0]     a,
  output  logic [2**N-1:0]  y
);

  always_comb
    begin
      y = 0;
      y[a] = 1;
    end

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
