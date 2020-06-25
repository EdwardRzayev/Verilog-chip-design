module lab8_3_one_hot
(
    input  clock,
    input  reset_n,
    input  enable,
    input  a,
    output reg    y
);

    parameter [2:0] 
				  S0 = 3'b001, 
				  S1 = 3'b010, 
				  S2 = 3'b100;

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
            if (a)
                next_state = S1;
            else
                next_state = S0;

        S1:
            if (a)
                next_state = S2;
            else
                next_state = S1;

        S2:
            if (a)
                next_state = S0;
            else
                next_state = S2;

        default:

            next_state = S0;

        endcase

    // Output logic based on current state

    always @ (posedge clock or negedge reset_n)
    begin
        if (! reset_n)
            y <= 0;
        else if (enable)
        begin
            y <= 1;
            case (state)
            S0:
                if (!a) 
                    y <= 0;
            S2:
                if (a)
                    y <= 0;
            endcase
        end
    end
endmodule