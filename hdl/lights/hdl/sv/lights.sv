module lights 
  #(parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001)
(
  input   logic   clk,
  input   logic   reset,
  input   logic   ta,  
  input   logic   tb,  
  input   logic   m,  
  output  logic [2:0]  la,
  output  logic [2:0]  lb
);

  typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
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
      S0:     if (~ta)
                nextstate = S1;
              else if (ta)
                nextstate = S0;
      S1:
              nextstate = S2;
      S2:     if (m | tb)
                nextstate = S2;
              else if ((~m) & (~tb))
                nextstate = S3;
      S3:
              nextstate = S0;
      default: nextstate = S0;
    endcase

  // output logic with one hot encoding
  always_comb
    case (state)
      S0:
        begin
          la = GREEN;
          lb = RED;
        end
      S1:
        begin
          la = YELLOW;
          lb = RED;
        end
      S2:
        begin
          la = RED;
          lb = GREEN;
        end
      S3:
        begin
          la = RED;
          lb = YELLOW;
        end
      default:
        begin
          la = RED;
          lb = RED;
        end
    endcase





  // so cocotb will output the wave file in the tests directory
  `ifdef  COCOTB_SIM 
  initial
   begin
      $dumpfile("wave_sv.vcd");
      $dumpvars(
        0,
        clk,
        reset,
        ta,
        tb,
        m,
        la,
        lb,
        state,
        nextstate
      );
      #5;
   end
  `endif

endmodule
