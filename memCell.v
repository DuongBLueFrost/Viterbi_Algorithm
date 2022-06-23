module memCell (
  input in, rs, we, 
  output out);
  
  wire q, t;
  
  and i1 (t, we, rs);
  d_latch dl (.D(in), .C(t), .Q(q));  
  bufif1 b1 (out, q, rs);
  
endmodule
