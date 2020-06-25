module d_latch1
(
	input clk,
	input d,
	output reg q
);
	always @(d or clk)
	if (!clk)
		q <= d;
endmodule
