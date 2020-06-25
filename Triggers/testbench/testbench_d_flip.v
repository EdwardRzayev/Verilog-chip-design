`timescale 1 ns / 100 ps

module testbench_d_flip;

    reg  clk, d;
    wire q, q_n;

    d_flip_flop d_flip_flop (clk, d, q, q_n);
    
    initial $dumpvars;

    initial
    begin
        
        
        $monitor ("%0d clk %b d %b q %b q_n %b", $time, clk, d, q, q_n);

        # 20;   clk = 0; d = 0; 
        # 20;   clk = 1; d = 0;
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 20;   clk = 0; d = 0;
        # 20;   clk = 1; d = 0;
        # 20;   clk = 0; d = 1;
        # 20;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0; 
        # 10;   clk = 0; d = 0;
        # 10;   clk = 0; d = 0;
        # 10;   clk = 1; d = 0;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 0; d = 1;
        # 10;   clk = 1; d = 1;
        # 10;   clk = 1; d = 0;
        # 20;

        $finish;
    end

endmodule
