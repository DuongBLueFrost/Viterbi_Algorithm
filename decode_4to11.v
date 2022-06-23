module decode_4to11 (in, out);
  input [3:0] in;
  output reg [10:0] out;

  always @(*) begin
    case(in)
      4'd0: out = 11'd1;
      4'd1: out = 11'd2;
      4'd2: out = 11'd4;
      4'd3: out = 11'd8;
      
      4'd4: out = 11'd16;
      4'd5: out = 11'd32;
      4'd6: out = 11'd64;
      4'd7: out = 11'd128;
      
      4'd8: out = 11'd256;
      4'd9: out = 11'd512;
      4'd10: out = 11'd1024;
    endcase
  end
endmodule