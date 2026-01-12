module mux_tb();
    reg a, b, sel;
    wire y;
    mux_2_to_1 MUX_UUT(
        .a(a), .b(b), .sel(sel), .y(y)
    );
    initial begin
        $dumpfile("mux_simulation.vcd");
        $dumpvars(0,mux_tb);
        $display("A B SEL | Y");
        a=0; b=0; sel=0; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=0; b=1; sel=0; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=1; b=0; sel=0; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=1; b=1; sel=0; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=0; b=0; sel=1; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=0; b=1; sel=1; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=1; b=0; sel=1; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        a=1; b=1; sel=1; #10;
        $display("%b %b  %b | %b", a, b, sel, y);
        $finish;
    end
endmodule