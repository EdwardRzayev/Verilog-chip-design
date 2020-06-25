module gray2bin_(gray, bin);
	parameter SIZE = 10;

	input  wire [SIZE-1:0]gray;
	output wire [SIZE-1:0]bin;

	genvar i;

	generate
		 for (i=0; i<SIZE; i=i+1)
			begin: bit
				assign bin[i] = ^gray[SIZE-1:i];
			end
		endgenerate
endmodule

module gray2bin
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	b10_gray2bin_v2  (SW,LEDR);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR);
	
endmodule