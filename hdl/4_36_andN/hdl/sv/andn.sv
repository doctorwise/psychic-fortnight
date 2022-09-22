module andn #(parameter width = 4) (
  input   logic [width-1:0]     a,
  output  logic                 y
);

  genvar i;
  logic [width-1:0] x;

  // please don't really do it this way...a reduction is preferred
  // however, it shows the generate functionality well
  generate
    assign x[0] = a[0];
    for (i=1; i<width; i=i+1) begin: forloop
      assign x[i] = a[i] & x[i-1];
    end
  endgenerate

  assign y = x[width-1];

  `ifdef  COCOTB_SIM 
  initial
   begin
      $dumpfile("wave_sv.vcd");
      $dumpvars(
        0,
        a,
        x,
        y
      );
      #5;
   end
   `endif

endmodule
