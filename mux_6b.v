
module mux_6b(s, a, b, q);
  parameter bits = 6;
  input s;
  input [bits-1:0] a, b;
  output [bits-1:0] q;
    
  wire [bits-1:0]q1;
    
  mux m[bits-1:0] (.s(s), .a(a), .b(b), .q(q));

endmodule



