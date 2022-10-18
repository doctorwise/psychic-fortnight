module mode (
  input   logic   clk,
  input   logic   reset,
  input   logic   p,  
  input   logic   r,  
  output  logic   m
);

  typedef enum logic {S0, S1} statetype;
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
      S0:     if (p)
                nextstate = S1;
              else 
                nextstate = S0;
      S1:     if (r)
                nextstate = S0;
              else
                nextstate = S1;
      default: nextstate = S0;
    endcase

  // output logic
  assign m = (state == S1);








  // so cocotb will output the wave file in the tests directory
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
        m,
        state,
        nextstate
      );
      #5;
   end
  `endif

endmodule
