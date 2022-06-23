module d_ff(
    input preset, clear, d,clk, 
    output q, qn); 
    
    wire x, y, z, t, a, b ;
    assign x = ~(preset & t & y);
    assign y = ~(x & clear & clk);
    assign z = ~(t & clk & y);
    assign t = ~(d & clear & z); 
    assign q = ~(preset & y & qn);
    assign qn = ~(clear & q & z);
endmodule
