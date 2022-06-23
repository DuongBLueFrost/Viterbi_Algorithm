module Max_posibility (clk, P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, enable, RW_Max_posibility, reset,
                        new_pre_addr, max_index, last_POS, max_pos);

    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
  
  input [p_size-1:0] P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10;
  input enable, RW_Max_posibility, clk, reset;
  output [POS_num - 1:0] new_pre_addr;
  output [POS_num_bit - 1:0] max_index;
  output reg [POS_num_bit - 1:0] last_POS;
  output [p_size - 1:0] max_pos;
  
  wire [p_size-1:0] m1_A, m2_B, m3_A, m4_A, m5_B, m6_B, m7_A, m8_A, m9_B;
  wire [POS_num_bit - 1:0] m1_index_A, m2_index_B, m3_index_A, m4_index_A, m5_index_B, m6_index_B, m7_index_A, m8_index_A, m9_index_B;
  
  max_and_index m1 (.enable(enable), .A(P0), .B(P1), .index_A(4'd0), .index_B(4'd1), .max_pos(m1_A), .index_of_max(m1_index_A));  
  max_and_index m2 (.enable(enable), .A(P2), .B(P3), .index_A(4'd2), .index_B(4'd3), .max_pos(m2_B), .index_of_max(m2_index_B));  
  max_and_index m3 (.enable(enable), .A(m1_A), .B(m2_B), .index_A(m1_index_A), .index_B(m2_index_B), .max_pos(m3_A), .index_of_max(m3_index_A));
  
  max_and_index m4 (.enable(enable), .A(P4), .B(P5), .index_A(4'd4), .index_B(4'd5), .max_pos(m4_A), .index_of_max(m4_index_A));  
  max_and_index m5 (.enable(enable), .A(P6), .B(P7), .index_A(4'd6), .index_B(4'd7), .max_pos(m5_B), .index_of_max(m5_index_B));  
  max_and_index m6 (.enable(enable), .A(m4_A), .B(m5_B), .index_A(m4_index_A), .index_B(m5_index_B), .max_pos(m6_B), .index_of_max(m6_index_B));
  
  max_and_index m7 (.enable(enable), .A(m3_A), .B(m6_B), .index_A(m3_index_A), .index_B(m6_index_B), .max_pos(m7_A), .index_of_max(m7_index_A));
  
  max_and_index m8 (.enable(enable), .A(P8), .B(P9), .index_A(4'd8), .index_B(4'd9), .max_pos(m8_A), .index_of_max(m8_index_A));  
  max_and_index m9 (.enable(enable), .A(m8_A), .B(P10), .index_A(m8_index_A), .index_B(4'd10), .max_pos(m9_B), .index_of_max(m9_index_B));
  
  max_and_index m10 (.enable(enable), .A(m7_A), .B(m9_B), .index_A(m7_index_A), .index_B(m9_index_B), .max_pos(max_pos), .index_of_max(max_index));

  decode_4to11 d1 (.in(max_index), .out(new_pre_addr));

always @(reset) begin
    if(!reset) 
        last_POS <= 0;
end

always @(posedge clk) begin
    if(RW_Max_posibility)
        last_POS <= max_index;
end
endmodule
