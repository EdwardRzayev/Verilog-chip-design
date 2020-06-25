module DECODER_ED (
 binary_in, decoder_out, enable
);

   parameter IN_SIZE = 6; 
	parameter OUT_SIZE = 1<<IN_SIZE;
	
	input  wire [IN_SIZE-1:0] binary_in;
	output wire [OUT_SIZE-1:0] decoder_out;
	input enable;
	
	genvar i;
	generate
		for(i=0; i<OUT_SIZE; i=i+1) begin : gen
		assign decoder_out[i] = binary_in==i & enable ? 1'b1: 1'b0;
		end
	endgenerate
endmodule