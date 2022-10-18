module controller (
  input   logic   clk,
  input   logic   reset,
  input   logic   p,
  input   logic   r,
  input   logic   ta,
  input   logic   tb,
  output  logic [2:0] la,
  output  logic [2:0] lb
);

logic [3:0] m;

mode modeFSM (
  clk,
  reset,
  p,
  r,
  m
);

lights lightsFSM (
  clk,
  reset,
  ta,
  tb,
  m,
  la,
  lb
);

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      clk,
      reset,
      p,
      r,
      ta,
      tb,
      la,
      lb,
      m
    );
    #5;
 end
 `endif

endmodule
