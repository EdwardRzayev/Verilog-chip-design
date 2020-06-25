`timescale 1 ns / 100 ps

module testbench;

    reg  clk, j, k;
    wire q, q_n;

    jk_latch jk_latch (clk, j, k, q, q_n);
    
    initial $dumpvars;

    initial
    begin
        
        
        $monitor ("%0d clk %b j %b k %b q %b q_n %b", $time, clk, j, k, q, q_n);
 		  //clk = 1, j = 1, k = 1, - Q = 1, Q_n = 1 
		  # 20;   clk = 1; j = 1; k = 1;		
        # 20;   clk = 1; j = 0; k = 1;
		  //clk = 0, j = x, k = x, - Qprev 
		  # 20;   clk = 0; j = 0; k = 0;
		  # 20;   clk = 0; j = 0; k = 1;
		  # 20;   clk = 0; j = 1; k = 0;
		  # 20;   clk = 0; j = 1; k = 1;
		  //clk = 1, j = 0, k = 0, - Qprev 
		  # 20;   clk = 1; j = 0; k = 0;
		  //clk = 1, j = 0, k = 1, - Q = 0, Q_n = 1 
		  # 20;   clk = 1; j = 0; k = 1;
		  //clk = 1, j = 1, k = 0, - Q = 1, Q_n = 0 
		  # 20;   clk = 1; j = 1; k = 0;  
        # 20;
        $finish;
    end

endmodule