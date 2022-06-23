module ram64x4 (rws, cs, cr, i, o);

  parameter nrows = 64;
  parameter nbits = 4;
  parameter addr_bits = 6;
  input rws,  cs;
  input [addr_bits-1:0] cr;
  input [nbits - 1 :0] i;
  output [nbits - 1 :0] o;
  
  wire re, we;
  wire [nrows - 1 :0]c; 
  wire [nbits - 1 :0] out;
  
  and i10 (we, cs, rws);
  and i12 (re, cs, ~rws);
  d6to64 i0 (.in(cr), .out(c));
  
  row4b i1[nrows -  1 :0] (.i(i), .o(out), .rs(c), .we(we)); 
  bufif1 i2[nbits - 1 :0] (o, out, re);
endmodule





