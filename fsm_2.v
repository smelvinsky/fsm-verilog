
/* 
 * Counter (weird NBC) Verilog example (iverilog 10.1)
 *
 */
 
 module counter
 (
     input clock,
     input reset,
     output [1:0] out
 );

    reg [1:0] out_tmp;
    reg [3:0] state;

    parameter [3:0] S0 = 3'd0;
    parameter [3:0] S1 = 3'd1;
    parameter [3:0] S2 = 3'd2;
    parameter [3:0] S3 = 3'd3;
    parameter [3:0] S4 = 3'd4;
    parameter [3:0] S5 = 3'd5;
    parameter [3:0] S6 = 3'd6;

    always @ (posedge(clock))

    if (reset)
        state <= 0;
    else
        begin
            case (state)
            S0:
                begin
                    out_tmp <= 2'd0;
                    state <= S1;
                end
            S1:
                begin
                    out_tmp <= 2'd3;
                    state <= S2;
                end
            S2:
                begin
                    out_tmp <= 2'd1;
                    state <= S3;
                end
            S3:
                begin
                    out_tmp <= 2'd2;
                    state <= S4;
                end      
            S4:
                begin
                    out_tmp <= 2'd2;
                    state <= S5;
                end
            S5:
                begin
                    out_tmp <= 2'd1;
                    state <= S6;
                end
            S6:
                begin
                    out_tmp <= 2'd3;
                    state <= S0;
                end  
              default:
                state <= S0; 
            endcase
        end    

    assign out = out_tmp;

endmodule