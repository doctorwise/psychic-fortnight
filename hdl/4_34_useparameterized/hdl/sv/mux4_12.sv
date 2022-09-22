module mux4_12 (
  input   logic [11:0] d0, d1, d2, d3,
  input   logic [1:0]  s,
  output  logic [11:0] y
);

  logic [11:0] low, hi;

  mux2 #(12) lowmux (
    d0,
    d1,
    s[0],
    low
  );
  
  mux2 #(12) himux (
    d2,
    d3,
    s[0],
    hi
  );

  mux2 #(12) outmux (
    low,
    hi,
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
        y
      );
      #5;
   end
   `endif

endmodule
