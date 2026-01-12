`timescale 1ns/1ps
module demux4_1_tb;
    reg d_in;
    reg [1:0] sel;
    wire [3:0] y_out;
    demux1to4 uut(
        .d_in(d_in), .sel(sel), .y_out(y_out)
    );
    initial begin

        $dumpfile("demux_sim.vcd");
        $dumpvars(0, demux4_1_tb);
        d_in = 1'b1; // Set input data to 1 for testing
        $display("Running Test Case for d_in=%b", d_in);
        // Test case 1
        sel = 2'b00; #10;
        $display("d_in=%b sel=%b => y_out=%b", d_in, sel, y_out); // Expected y_out=0001
        // Test case 2
        sel = 2'b01; #10;
        $display("d_in=%b sel=%b => y_out=%b", d_in, sel, y_out); // Expected y_out=0010
        // Test case 3
        sel = 2'b10; #10;
        $display("d_in=%b sel=%b => y_out=%b", d_in, sel, y_out); // Expected y_out=0100
        // Test case 4
        sel = 2'b11; #10;
        $display("d_in=%b sel=%b => y_out=%b", d_in, sel, y_out); // Expected y_out=1000
        $finish;
    end
endmodule
