// Dataflow modeling of basic logic gates
module basic_gates_dataflow (
  input a, b,
  output and_out, or_out, nand_out, nor_out,
  output xor_out, xnor_out, not_a
);

  assign and_out  = a & b;
  assign or_out   = a | b;
  assign nand_out = ~(a & b);
  assign nor_out  = ~(a | b);
  assign xor_out  = a ^ b;
  assign xnor_out = ~(a ^ b);
  assign not_a    = ~a;

endmodule
