module dmem (
  input   logic         clk,
  input   logic         we,
  input   logic [7:0]  a,
  input   logic [31:0]  wd,
  output  logic [31:0]  rd
);

  logic [31:0] mem [63:0];

  assign rd = mem[a[7:2]];

  always_ff @(posedge clk)
    if (we) mem[a[7:2]] <= wd;

endmodule
