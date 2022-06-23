module d2to4 (in, out);
  input [1:0] in;
  output [3:0] out;
  
  not n1 (nin0, in[0]);
  not n2 (nin1, in[1]);
  
  and a1 (out[0], nin1, nin0);
  and a2 (out[1], nin1, in[0]);
  and a3 (out[2], in[1], nin0);
  and a4 (out[3], in[1], in[0]); 
  
endmodule 
