module test();
      parameter word_num_bit = 8;
      parameter POS_num_bit = 4;
      parameter POS_num = 11;
      parameter word_num = 50;
      parameter p_size = 32;
      reg [word_num_bit - 1:0] key;
      reg [POS_num_bit - 1:0] POS;
      reg [31:0] posibility;
      reg [POS_num - 1:0] pre_addr;
      reg RW_HMM_matrix, reset, clk;
      reg [POS_num - 1:0] change_pre_addr;
      reg [POS_num_bit - 1:0] change_p_index;
      reg change_enable, choose_output;
      wire [p_size - 1:0] P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10;
      wire [POS_num - 1:0] pre_addr_out;
      wire [POS_num_bit - 1:0] POS_out;
      
initial begin
    key <= 0;
    POS <= 0; 
    posibility <= 0;
    pre_addr <= 0;
    RW_HMM_matrix <= 0;
    clk <= 0;
    change_pre_addr <= 0;
    change_p_index <= 0;
    change_enable <= 0;
    choose_output <= 0;
    reset <= 0;
    #3 reset <= 1;
end      

always begin
    #6 clk = ~clk;
end

always begin
    fork 
        #5 key <= 1;
        #5 POS <= 0;
        #5 posibility <= 123;
        #5 pre_addr <= 1;
        #4 RW_HMM_matrix <= 1;
        #15 key <= 1;
        #15 POS <= 0;
        #15 posibility <= 321;
        #15 pre_addr <= 3;
        #25 key <= 1;
        #25 POS <= 3;
        #25 posibility <= 124;
        #25 pre_addr <= 3;
        #30 RW_HMM_matrix <= 0;
        #35 key <= 1;
        #35 choose_output <= 1;
    join
end
      
HMM_matrix s(.key, .POS, .posibility, .pre_addr, .RW_HMM_matrix, .reset, .clk, 
  .change_pre_addr, .change_p_index, .change_enable, .choose_output, 
  .P0, .P1, .P2, .P3, .P4, .P5, .P6, .P7, .P8 , .P9, .P10, .pre_addr_out, .POS_out);
endmodule
