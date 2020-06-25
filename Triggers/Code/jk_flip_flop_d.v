module jk_flip_flop_d
(
	input clk,
	input j,
	input k,
	output q
);
	wire d = ~(q & ~j) | (q & ~k);
	d_flip_flops d_flip_flop(clk, d, q);
endmodule
