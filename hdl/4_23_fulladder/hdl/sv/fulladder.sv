module fulladder (
	input   logic a, b, cin,
	output  logic s, cout
);

	logic p, g;

  always_comb // equivalent to always @(a, b, cin), prevents missing a signal
    begin
      // in general it's best to use blocking assignments for combinational
      // logic specification
      p = a ^ b;            // blocking
      g = a & b;            // blocking
      s = p ^ cin;          // blocking
      cout = g | (p & cin); // blocking
    end

`ifdef  COCOTB_SIM 
initial
 begin
    $dumpfile("wave_sv.vcd");
    $dumpvars(
      0,
      a,
      b,
      cin,
      p,
      g,
      s,
      cout
    );
    #5;
 end
`endif

endmodule
