
module d6to64 (
  input [5:0] in,
  input choose,
  output [63:0] out);
  
  wire [7:0] c;
  
  d3to8 tf (.out(c), .in(in[5:3]), .choose(1'd1));
  
  d3to8 te1 (.out(out[63:56]), .in(in[2:0]), .choose(c[7]));
  d3to8 te2 (.out(out[55:48]), .in(in[2:0]), .choose(c[6]));
  d3to8 te3 (.out(out[47:40]), .in(in[2:0]), .choose(c[5]));
  d3to8 te4 (.out(out[39:32]), .in(in[2:0]), .choose(c[4]));
  d3to8 te5 (.out(out[31:24]), .in(in[2:0]), .choose(c[3]));
  d3to8 te6 (.out(out[23:16]), .in(in[2:0]), .choose(c[2]));
  d3to8 te7 (.out(out[15:8]), .in(in[2:0]), .choose(c[1]));
  d3to8 te8 (.out(out[7:0]), .in(in[2:0]), .choose(c[0]));
    
endmodule


