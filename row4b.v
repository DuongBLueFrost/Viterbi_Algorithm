module row4b (i,o, rs, we);
  
  parameter n = 4;
  
  input [n-1:0] i;
  output [n-1:0] o;
  input rs, we;
  
  memCell m1[n-1:0] (.in(i), .rs(rs), .we(we), .out(o));
endmodule









