module test_datapath ();

    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4; 

    reg clk, reset, increment_enable_Words_control,
                 increment_enable_Emiss_control,
                 increment_enable_Transition_control, 
                 RW_Key_reg, decrement_enable, 
                 RW_Pre_addr_encode, RW_Pre_Posibility,
                 S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2,
                 S_posibility_0, S_posibility_1, RW_HMM_matrix, 
                 change_enable, choose_output,
                 RW_Max_posibility, RW_Stack_POS, reset_Stack_POS;
    wire       error, endline, multiple_source, stack_empty;
    wire [3:0] i, final_POS, j;
    wire [7:0] key;  

    wire [word_num_bit - 1:0] word_out;
    wire [p_size - 1:0] emiss_out, trans_out, pre_pos_out, hmm0, hmm1, hmm2, hmm3, hmm4, hmm5, hmm6, hmm7, hmm8, hmm9, hmm10;
    wire [POS_num_bit - 1:0] trans_curr, pre_encode_out, hmm_pos, max_pindex, max_lastpos;
    wire [POS_num - 1:0] hmm_preaddr, max_preaddr;

initial begin
    clk <= 0; 
    increment_enable_Words_control <= 0; 
    increment_enable_Emiss_control <= 0; 
    increment_enable_Transition_control <= 0;  
    RW_Key_reg <= 0;  
    decrement_enable <= 0;  
    RW_Pre_addr_encode <= 0;  
    RW_Pre_Posibility <= 0; 
    S_key_0 <= 0;  
    S_key_1 <= 0;  
    S_POS_HMM_0 <= 0;  
    S_POS_HMM_1 <= 0;  
    S_POS_HMM_2 <= 0; 
    S_posibility_0 <= 0;  
    S_posibility_1 <= 0;  
    RW_HMM_matrix <= 0;  
    change_enable <= 0;  
    choose_output <= 0; 
    RW_Max_posibility <= 0;  
    RW_Stack_POS <= 0;  
    reset_Stack_POS <= 0;
    reset <= 0;
    #5 reset <= ~reset;
end  

always begin
    #10 clk = ~clk;
end  

always begin
    #30 
    increment_enable_Words_control <= 0; 
    increment_enable_Emiss_control <= 1; 
    increment_enable_Transition_control <= 0;  
    RW_Key_reg <= 1;  
    decrement_enable <= 0;  
    RW_Pre_addr_encode <= 0;  
    RW_Pre_Posibility <= 0; 
    S_key_0 <= 0;  
    S_key_1 <= 1;  
    S_POS_HMM_0 <= 1;  
    S_POS_HMM_1 <= 0;  
    S_POS_HMM_2 <= 0; 
    S_posibility_0 <= 0;  
    S_posibility_1 <= 1;  
    RW_HMM_matrix <= 1;  
    change_enable <= 0;  
    choose_output <= 0; 
    RW_Max_posibility <= 0;  
    RW_Stack_POS <= 0;  
    reset_Stack_POS <= 1;
    #200
    increment_enable_Words_control <= 0; 
    increment_enable_Emiss_control <= 0; 
    increment_enable_Transition_control <= 0;  
    RW_Key_reg <= 1;  
    decrement_enable <= 0;  
    RW_Pre_addr_encode <= 0;  
    RW_Pre_Posibility <= 1; 
    S_key_0 <= 0;  
    S_key_1 <= 1;  
    S_POS_HMM_0 <= 1;  
    S_POS_HMM_1 <= 0;  
    S_POS_HMM_2 <= 0; 
    S_posibility_0 <= 0;  
    S_posibility_1 <= 1;  
    RW_HMM_matrix <= 1;  
    change_enable <= 0;  
    choose_output <= 1; 
    RW_Max_posibility <= 0;  
    RW_Stack_POS <= 0;  
    reset_Stack_POS <= 1;
    #20
    increment_enable_Words_control <= 1; 
    increment_enable_Emiss_control <= 0; 
    increment_enable_Transition_control <= 0;  
    RW_Key_reg <= 1;  
    decrement_enable <= 0;  
    RW_Pre_addr_encode <= 0;  
    RW_Pre_Posibility <= 0; 
    S_key_0 <= 0;  
    S_key_1 <= 0;  
    S_POS_HMM_0 <= 0;  
    S_POS_HMM_1 <= 0;  
    S_POS_HMM_2 <= 0; 
    S_posibility_0 <= 0;  
    S_posibility_1 <= 0;  
    RW_HMM_matrix <= 0;  
    change_enable <= 0;  
    choose_output <= 0; 
    RW_Max_posibility <= 0;  
    RW_Stack_POS <= 0;  
    reset_Stack_POS <= 1;    
    #20 
    increment_enable_Words_control <= 0; 
    increment_enable_Emiss_control <= 0; 
    increment_enable_Transition_control <= 1;  
    RW_Key_reg <= 1;  
    decrement_enable <= 0;  
    RW_Pre_addr_encode <= 0;  
    RW_Pre_Posibility <= 0; 
    S_key_0 <= 0;  
    S_key_1 <= 1;  
    S_POS_HMM_0 <= 1;  
    S_POS_HMM_1 <= 0;  
    S_POS_HMM_2 <= 0; 
    S_posibility_0 <= 1;  
    S_posibility_1 <= 0;  
    RW_HMM_matrix <= 1;  
    change_enable <= 0;  
    choose_output <= 0; 
    RW_Max_posibility <= 0;  
    RW_Stack_POS <= 0;  
    reset_Stack_POS <= 1;
    #220
    increment_enable_Words_control <= 0; 
    increment_enable_Emiss_control <= 0; 
    increment_enable_Transition_control <= 0;  
    RW_Key_reg <= 1;  
    decrement_enable <= 0;  
    RW_Pre_addr_encode <= 0;  
    RW_Pre_Posibility <= 0; 
    S_key_0 <= 0;  
    S_key_1 <= 1;  
    S_POS_HMM_0 <= 1;  
    S_POS_HMM_1 <= 0;  
    S_POS_HMM_2 <= 0; 
    S_posibility_0 <= 1;  
    S_posibility_1 <= 0;  
    RW_HMM_matrix <= 0;  
    change_enable <= 0;  
    choose_output <= 1; 
    RW_Max_posibility <= 0;  
    RW_Stack_POS <= 0;  
    reset_Stack_POS <= 1;
end

datapath d(.clk, .reset, .increment_enable_Words_control, 
                 .increment_enable_Emiss_control,
                 .increment_enable_Transition_control, 
                 .RW_Key_reg, .decrement_enable, 
                 .RW_Pre_addr_encode, .RW_Pre_Posibility,
                 .S_key_0, .S_key_1, .S_POS_HMM_0, .S_POS_HMM_1, .S_POS_HMM_2,
                 .S_posibility_0, .S_posibility_1, .RW_HMM_matrix, 
                 .change_enable, .choose_output,
                 .RW_Max_posibility, .RW_Stack_POS,
                 .error, .endline, .i, .multiple_source, .stack_empty,
                 .final_POS, .key,
                 
                 .J(j),
                 .word_out(word_out), .emiss_out(emiss_out), .trans_out(trans_out), .trans_curr(trans_curr),
                 .pre_encode_out(pre_encode_out), .pre_pos_out(pre_pos_out), 
                 .hmm0(hmm0), .hmm1(hmm1), .hmm2(hmm2), .hmm3(hmm3), .hmm4(hmm4), .hmm5(hmm5), .hmm6(hmm6), 
                 .hmm7(hmm7), .hmm8(hmm8), .hmm9(hmm9), .hmm10(hmm10),
                 .hmm_preaddr(hmm_preaddr), .hmm_pos(hmm_pos), 
                 .max_preaddr(max_preaddr), .max_pindex(max_pindex), .max_lastpos(max_lastpos));
endmodule                 
