module inv (

  input   logic [3:0] a,  // represents a 4-bit bus (little-endian order,
                          // where the least significant bit has the smallest 
                          // bit number

  output  logic [3:0] y   // represents a 4-bit bus (little endian order)

);

  assign y = ~a;

endmodule
