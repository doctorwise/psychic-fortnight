module swizzling (
	output logic [7:0] y
);
	assign y = {3'b101, 5'b00001};
endmodule
