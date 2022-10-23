module micro (
  input   logic         clk,
  input   logic         reset,
  output  logic [31:0]  writedata,
  output  logic [31:0]  dataadr,
  output  logic         memwrite
);

  logic   [31:0]  pc, instr, readdata;

  // arm  arm(...)

  imem  imem(pc, instr);
  dmem  dmem(clk, memwrite, dataadr, writedata, readdata); 

endmodule
