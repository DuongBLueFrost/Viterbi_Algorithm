module has(
    input en, d, qi, ci,
    output co, do
  );
  
assign co = en & ci & (d ^ qi);
assign do = (~en & qi) | (qi & ~ci) | (en & ~qi & ci);
  
endmodule
