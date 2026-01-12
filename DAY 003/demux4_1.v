module demux1to4 (
    input d_in,       
    input [1:0] sel,  
    output reg [3:0] y_out 
);
    always @(*) begin
        // Initializing all outputs to 0 to prevent latches
        y_out = 4'b0000;
        
        case (sel)
            2'b00: y_out[0] = d_in;
            2'b01: y_out[1] = d_in;
            2'b10: y_out[2] = d_in;
            2'b11: y_out[3] = d_in;
        endcase
    end

endmodule