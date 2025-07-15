module basic_gates_tb;
  reg a, b;
  wire and_d, or_d, nand_d, nor_d, xor_d, xnor_d, not_d;
  wire and_s, or_s, nand_s, nor_s, xor_s, xnor_s, not_s;

  // Instantiate dataflow module
  basic_gates_dataflow dflow (
    .a(a), .b(b),
    .and_out(and_d), .or_out(or_d), .nand_out(nand_d),
    .nor_out(nor_d), .xor_out(xor_d), .xnor_out(xnor_d), .not_a(not_d)
  );

  // Instantiate structural module
  basic_gates_structural struc (
    .a(a), .b(b),
    .and_out(and_s), .or_out(or_s), .nand_out(nand_s),
    .nor_out(nor_s), .xor_out(xor_s), .xnor_out(xnor_s), .not_a(not_s)
  );

  initial begin
    $dumpfile("basic_gates.vcd");
    $dumpvars(0, basic_gates_tb);

    $display(" a b | DF_AND ST_AND | DF_OR ST_OR | ... | DF_NOT ST_NOT");
    $monitor(" %b %b |   %b     %b   |   %b   %b  | ... |   %b     %b",
             a, b, and_d, and_s, or_d, or_s, not_d, not_s);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
  end
endmodule
