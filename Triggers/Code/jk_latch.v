module jk_latch
(
	input clk,
	input j,
	input k,
	output q,
	output q_n
);
	wire r = ~(j & clk & q_n);
	wire s = ~(k & clk & q);

	RS_Trigger RS_Trigger (s, r, q, q_n);
endmodule

