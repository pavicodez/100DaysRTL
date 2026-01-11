`timescale 1ns / 1ps

module master_tb;

    // --- 1. Variables for Half Adder & Full Adder Testing ---
    reg a, b, cin;
    wire ha_sum, ha_carry;
    wire fa_sum, fa_carry;

    // --- 2. Variables for 4-bit RCA Testing ---
    reg [3:0] A_bus, B_bus;
    reg cin_rca;
    wire [3:0] sum_rca;
    wire cout_rca;

    // --- INSTANTIATION: Connecting your separate files ---
    
    // Unit 1: The Half Adder
    half_adder HA_UUT (
        .a(a), .b(b), 
        .sum(ha_sum), .carry(ha_carry)
    );

    // Unit 2: The Full Adder
    full_adder FA_UUT (
        .a(a), .b(b), .cin(cin), 
        .sum(fa_sum), .carry(fa_carry)
    );

    // Unit 3: The 4-bit Ripple Carry Adder
    ripple_carry_adder_4bit RCA_UUT (
        .A(A_bus), .B(B_bus), .cin(cin_rca), 
        .sum(sum_rca), .cout(cout_rca)
    );

    // --- TEST SEQUENCE ---
    initial begin
        $dumpfile("master_simulation.vcd");
        $dumpvars(0, master_tb);

        // ==========================================
        // TEST 1: Half Adder
        // ==========================================
        $display("-----------------------------------------");
        $display("Testing Half Adder (half_adder.v)");
        $display("A B | Sum Carry");
        
        a=0; b=0; #10; $display("%b %b |  %b    %b", a, b, ha_sum, ha_carry);
        a=0; b=1; #10; $display("%b %b |  %b    %b", a, b, ha_sum, ha_carry);
        a=1; b=0; #10; $display("%b %b |  %b    %b", a, b, ha_sum, ha_carry);
        a=1; b=1; #10; $display("%b %b |  %b    %b", a, b, ha_sum, ha_carry);

        // ==========================================
        // TEST 2: Full Adder
        // ==========================================
        $display("\n-----------------------------------------");
        $display("Testing Full Adder (full_adder.v)");
        $display("A B Cin | Sum Carry");

        a=0; b=0; cin=0; #10; $display("%b %b  %b  |  %b    %b", a, b, cin, fa_sum, fa_carry);
        a=0; b=1; cin=0; #10; $display("%b %b  %b  |  %b    %b", a, b, cin, fa_sum, fa_carry);
        a=1; b=1; cin=0; #10; $display("%b %b  %b  |  %b    %b", a, b, cin, fa_sum, fa_carry);
        a=1; b=1; cin=1; #10; $display("%b %b  %b  |  %b    %b", a, b, cin, fa_sum, fa_carry);

        // ==========================================
        // TEST 3: 4-bit Ripple Carry Adder
        // ==========================================
        $display("\n-----------------------------------------");
        $display("Testing 4-bit RCA (4bit_rca.v)");
        $display("  A     B   Cin |  Sum   Cout");

        // 2 + 3 = 5
        A_bus=4'd2; B_bus=4'd3; cin_rca=0; #10;
        $display("%b  %b   %b  | %b    %b (Expect 0101)", A_bus, B_bus, cin_rca, sum_rca, cout_rca);

        // 15 + 1 = 0 (with Carry out)
        A_bus=4'd15; B_bus=4'd1; cin_rca=0; #10;
        $display("%b  %b   %b  | %b    %b (Expect 0000, Cout=1)", A_bus, B_bus, cin_rca, sum_rca, cout_rca);

        // 10 + 5 + 1 (cin) = 0 (with Carry out)
        A_bus=4'd10; B_bus=4'd5; cin_rca=1; #10;
        $display("%b  %b   %b  | %b    %b (Expect 0000, Cout=1)", A_bus, B_bus, cin_rca, sum_rca, cout_rca);

        $finish;
    end

endmodule