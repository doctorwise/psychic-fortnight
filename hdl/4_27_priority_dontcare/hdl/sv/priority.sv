module priorityckt (
	input   logic [3:0] a,
  output  logic [3:0] y
);

// in SystemVerilog, if statements must always appear within always statements.
always_comb
  casez(a)
    4'b1???: y = 4'b1000;
    4'b01??: y = 4'b0100;
    4'b001?: y = 4'b0010;
    4'b0001: y = 4'b0001;
    default: y = 4'b0000;
  endcase

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
