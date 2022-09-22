module divby3 (
  input   logic   clk,
  input   logic   reset,
  output  logic   y
);

  // use this typedef statement to define a statetype with three possibilities
  // S0, S1, and S2 represented by two bits.
  typedef enum logic [1:0] {S0, S1, S2} statetype;
  // define two signals of this type
  statetype state, nextstate;

  // FSM Logic

  // synchronizing register
  always_ff@(posedge clk, posedge reset)
    if (reset) state <= S0;
    else       state <= nextstate;

  // next state logic
  always_comb
    case (state)
      S0:      nextstate = S1;
      S1:      nextstate = S2;
      S2:      nextstate = S0;
      default: nextstate = S0;
    endcase

  // output logic
  assign y = (state == S0);









  `ifdef  COCOTB_SIM 
  initial
   begin
      $dumpfile("wave_sv.vcd");
      $dumpvars(
        0,
        clk,
        reset,
        y,
        state,
        nextstate
      );
      #5;
   end
  `endif

endmodule
