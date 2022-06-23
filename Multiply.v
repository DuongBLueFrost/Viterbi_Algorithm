module Multiply (a, b, result);
  input [31:0] a, b;
  output [31:0] result;
  
  wire [23:0] c1, c2;
  wire [47:0] temp;
  wire [31:0] re;
  
  assign re[31] = 0;
  assign re[30:23] = a[30:23] + b[30:23] - 126;
  
  assign c1[23] = 1;
  assign c1[22:0] = a[22:0];
  
  assign c2[23] = 1;
  assign c2[22:0] = b[22:0];
  
  assign temp = c1 * c2;
  assign re[22:0] = temp[46:24];
  
  assign result = (a == 0 || b == 0) ? 0:re;
endmodule
