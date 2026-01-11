module basic_gates_structural (
  input a, b,
  output and_out, or_out, nand_out, nor_out,
  output xor_out, xnor_out, not_a
);

  and  u1 (and_out, a, b);
  or   u2 (or_out, a, b);
  nand u3 (nand_out, a, b);
  nor  u4 (nor_out, a, b);
  xor  u5 (xor_out, a, b);
  xnor u6 (xnor_out, a, b);
  not  u7 (not_a, a);

endmodule
