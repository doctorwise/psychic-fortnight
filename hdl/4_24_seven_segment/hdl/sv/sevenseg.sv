module sevenseg (
	input   logic [3:0] data,
  output  logic [6:0] segments
);

// always statements allow us to use case statements, which must always
// appear within always statements
always_comb
  case (data)
    0: segments = 7'b111_1110;
    1: segments = 7'b011_0000;
    2: segments = 7'b110_1101;
    3: segments = 7'b111_1001;
    4: segments = 7'b011_0011;
    5: segments = 7'b101_1011;
    6: segments = 7'b101_1111;
    7: segments = 7'b111_0000;
    8: segments = 7'b111_1111;
    9: segments = 7'b111_0011;
    default: segments = 7'b000_0000;
  endcase

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      data,
      segments
    );
    #5;
 end
`endif

endmodule
