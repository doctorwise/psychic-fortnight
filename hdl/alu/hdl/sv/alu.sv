module alu(
  input  logic [31:0] a, b,
  input  logic [1:0]  alucontrol,
  output logic [31:0] result,
  output logic [3:0]  aluflags
);

  logic        neg, zero, carry, overflow;
  logic [31:0] condinvb;
  logic [32:0] sum;

  assign condinvb = alucontrol[0] ? ~b : b;
  assign sum = a + condinvb + alucontrol[0];

  always_comb
    casex (alucontrol[1:0])
      2'b0?: result = sum;
      2'b10: result = a & b;
      2'b11: result = a | b;
    endcase

  assign neg      = result[31];
  assign zero     = (result == 32'b0);
  assign carry    = (alucontrol[1] == 1'b0) & sum[32];
  assign overflow = (~alucontrol[1]) & ~(a[31] ^ b[31] ^ alucontrol[0]) & (a[31] ^ sum[31]);
  assign aluflags = {neg, zero, carry, overflow};
endmodule

