`timescale 1ns/1ps
module mux4_1_tb;
    reg [3:0] in;
    reg [1:0] sel;
    wire [1:0] y;
    mux4_1 uut(
        .in(in), .sel(sel), .y(y)
    );
    initial begin

        $dumpfile("mux_sim.vcd");
        $dumpvars(0, mux4_1_tb);


        $display("Running Test Case for in=%b", in);
        // Test case 1
        in = 4'b1010; sel = 2'b00; #10;
        $display("in=%b sel=%b => y=%b", in, sel, y); // Expected y=0

        // Test case 2
        in = 4'b1010; sel = 2'b01; #10;
        $display("in=%b sel=%b => y=%b", in, sel, y); // Expected y=1

        // Test case 3
        in = 4'b1010; sel = 2'b10; #10;
        $display("in=%b sel=%b => y=%b", in, sel, y); // Expected y=0

        // Test case 4
        in = 4'b1010; sel = 2'b11; #10;
        $display("in=%b sel=%b => y=%b", in, sel, y); // Expected y=1

        // Test case 5
        in = 4'b1111; sel = 2'b10; #10;
        $display("in=%b sel=%b => y=%b", in, sel, y); // Expected y=1

        // Test case 6
        in = 4'b0000; sel = 2'b01; #10;
        $display("in=%b sel=%b => y=%b", in, sel, y); // Expected y=0

        $finish;
    end 
endmodule
