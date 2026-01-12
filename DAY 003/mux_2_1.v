module mux_2_to_1 (
    input a, b, sel,
    output y
);
assign y = sel ? b:a;
endmodule
