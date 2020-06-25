module DOP_171
(
	input clock,
	input reset_n,
	input enable,
	input [1:0] a,
	output reg y0,
	output reg y1,
	output reg y2,
	output reg y3,
	output reg y4
);

    parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011;

    reg [2:0] state, next_state;

    // State register

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            state <= S0;
        else if (enable)
            state <= next_state;

    // Next state logic

    always @*
        case (state)
        
        S0:
				case (a)
				2'b00:
					next_state = S1;
            2'b01:
					next_state = S2;
				2'b10:
					next_state = S2;
				2'b11:
					next_state = S2; 
				endcase

        S1:
				case (a)
				2'b00:
					next_state = S2;
            2'b01:
					next_state = S1;
				2'b10:
					next_state = S2;
				2'b11:
					next_state = S1;
				endcase

        S2:
				case (a)
				2'b00:
					next_state = S1;
            2'b01:
					next_state = S0;
				2'b10:
					next_state = S2;
				2'b11:
					next_state = S2; 
				endcase
					
        S3:
		  		case (a)
				2'b00:
					next_state = S1;
            2'b01:
					next_state = S0;
				2'b10:
					next_state = S3;
				2'b11:
					next_state = S3; 
				endcase	 

        default:

            next_state = S0;

        endcase

    // Output logic based on current state

    always @ (posedge clock or negedge reset_n)
    begin
		if (! reset_n)
			begin
				y0 <= 0;
				y1 <= 0;
				y2 <= 0;
				y3 <= 0;
			end
		
		else if (enable)
			begin
				y0 <= 0;
				y1 <= 0;
				y2 <= 0;
				y3 <= 0;
			case (state)
				S0:
					if (a == 2'b00)
						y0 <= 1;
					else if (a == 2'b01)
						y0 <= 1;
					else if (a == 2'b10)
						y0 <= 1;
					else if (a == 2'b11)
						y0 <= 1;

				S1:
					if (a == 2'b00)
						y1 <= 1;
					else if (a == 2'b01)
						y1 <= 1;
					else if (a == 2'b10)
						y1 <= 1;
					else if (a == 2'b11)
						y1 <= 1;

				S2:
					if (a == 2'b00)
						y0 <= 1;
					else if (a == 2'b01)
						y0 <= 1;
					else if (a == 2'b10)
						y0 <= 1;
					else if (a == 2'b11)
						y0 <= 1;

				S3:
					if (a == 2'b00)
						y2 <= 1;
					else if (a == 2'b01)
						y2 <= 1;
					else if (a == 2'b10)
						y2 <= 1;
					else if (a == 2'b11)
						y2 <= 1;
			endcase
		end
		end
endmodule

module DOP_17
(
input [4:0] SW,
output [9:0] LEDR
);

assign LEDR[9:5] = 0;
DOP_171 kek
(
.clock(SW[0]),
.reset_n(SW[1]),
.enable(SW[2]),
.a(SW[4:3]),
.y0(LEDR[0]),
.y1(LEDR[1]),
.y2(LEDR[2]),
.y3(LEDR[3]),
.y4(LEDR[4])
);
endmodule