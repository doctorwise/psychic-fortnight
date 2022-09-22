module mealy (
  input   logic   clk,
  input   logic   reset,
  input   logic   a,  
  output  logic   y
);

  // use this typedef statement to define a statetype with two possibilities
  // S0, S1 represented by one bit.
  typedef enum logic {S0 = 0, S1 = 1} statetype;
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
      S0:     if (a)
                nextstate = S0;
              else
                nextstate = S1;
      S1:     if (a)
                nextstate = S0;
              else
                nextstate = S1;
      default: nextstate = S0;
    endcase

  // output logic
  assign y = (a & state == S1);








  // so cocotb will output the wave file in the tests directory
  `ifdef  COCOTB_SIM 
  initial
   begin
      $dumpfile("wave_sv.vcd");
      $dumpvars(
        0,
        clk,
        reset,
        a,
        y,
        state,
        nextstate
      );
      #5;
   end
  `endif

endmodule
