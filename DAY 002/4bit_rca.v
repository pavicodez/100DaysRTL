// Dataflow modeling of 4-bit ripple carry adder
module ripple_carry_adder_4bit (
    input [3:0] A, B,
    input cin,
    output [3:0] sum,
    output cout
    );
    
    wire c1, c2, c3;
    
    full_adder FA0 (
        .a(A[0]),
        .b(B[0]),
        .cin(cin),
        .sum(sum[0]),
        .carry(c1)
    );
    
    full_adder FA1 (
        .a(A[1]),
        .b(B[1]),
        .cin(c1),
        .sum(sum[1]),
        .carry(c2)
    );
    
    full_adder FA2 (
        .a(A[2]),
        .b(B[2]),
        .cin(c2),
        .sum(sum[2]),
        .carry(c3)
    );
    
    full_adder FA3 (
        .a(A[3]),
        .b(B[3]),
        .cin(c3),
        .sum(sum[3]),
        .carry(cout)
    );

endmodule
