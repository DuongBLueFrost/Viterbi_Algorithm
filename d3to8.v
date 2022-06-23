module d3to8 (
  input [2:0] in,
  input choose,
  output [7:0] out);
  
  wire n1, n2, n3;
  wire [7:0]out1, out2;
  not nt1 (n1, in[2]);
  not nt2 (n2, in[1]);
  not nt3 (n3, in[0]);
  and a1 (out1[0], choose, n1, n2, n3);
  and a2 (out1[1], choose, n1, n2, in[0]);
  and a3 (out1[2], choose, n1, in[1], n3);
  and a4 (out1[3], choose, n1, in[1], in[0]);
  and a5 (out1[4], choose, in[2], n2, n3);
  and a6 (out1[5], choose, in[2], n2, in[0]);
  and a7 (out1[6], choose, in[2], in[1], n3);
  and a8 (out1[7], choose, in[2], in[1], in[0]);
  
  buf i1[7:0] (out2, out1);
  buf i2[7:0] (out, out2); 
  
endmodule
