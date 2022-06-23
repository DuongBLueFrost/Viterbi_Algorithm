module mux(
    input s, a, b,
    output q
);

  not i0 (ns, s);
  and i1 (ta, ns, a);
  and i2 (tb, s, b);
  or i3(q, ta, tb);  
    
endmodule