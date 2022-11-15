module extender (
  input   logic   [23:0]    instr,
  input   logic   [ 1:0]    immsrc,
  output  logic   [31:0]    extimm
);

  assign extimm = (immsrc == 2'b00) ?
    {24'b0, instr[7:0]} :
      (immsrc == 2'b01) ?
        {20'b0, instr[11:0]} :
          (immsrc == 2'b10) ?
            {{6{instr[23]}}, instr[23:0], 2'b00} :
            32'bx;

endmodule
