// here we declare parameters with the following syntax:
//
//  #(parameter <name> [= <default value>])
//
module mux2 #(parameter width = 8) (
  input   logic [width-1:0] d0, d1,
  input   logic             s,
  output  logic [width-1:0] y
);

  assign y = s ? d1 : d0;

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
