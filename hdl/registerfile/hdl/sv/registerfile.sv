module registerfile (
  input   logic             clk,
  input   logic             we3,
  input   logic   [3:0]     ra1, ra2, wa3,
  input   logic   [31:0]    wd3, r15,
  output  logic   [31:0]    rd1, rd2
);

  logic   [31:0]  rf[14:0];

  always_ff @(posedge clk)
    if (we3 & (wa3 < 15)) rf[wa3] <= wd3;

  assign rd1 = (ra1 == 15) ? (r15) : rf[ra1];
  assign rd2 = (ra2 == 15) ? (r15) : rf[ra2];

  `ifdef  COCOTB_SIM 
  initial
   begin
      $dumpfile("wave_sv.vcd");
      $dumpvars(
        0,
        clk,
        we3,
        ra1, ra2, wa3,
        wd3, r15, 
        rd1, rd2
      );
      #5;
   end
  `endif


endmodule
