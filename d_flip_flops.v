module d_flip_flops
(
	input clk,
	input d,
	output reg q
);
	always @ (negedge clk)
		q <= d;
endmodule

