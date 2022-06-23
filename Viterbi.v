module Viterbi (clk, reset, start, state, key, error, endline, final_POS, done,
                 
                 i, j,
                 word_out, emiss_out, trans_out, trans_curr, Pre_out,
                 pre_encode_out, pre_pos_out, 
                 hmm0, hmm1, hmm2, hmm3, hmm4, hmm5, hmm6, hmm7, hmm8, hmm9, hmm10,
                 multiple_s, hmm_preaddr, hmm_pos, 
                 max_preaddr, max_pindex, max_lastpos);

    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4; 
  
    input clk, reset, start;
    output error, endline, done, multiple_s;
    output [word_num_bit - 1:0] key;
    output [POS_num_bit - 1:0] final_POS, state, i, j ; 

    output [word_num_bit - 1:0] word_out;
    output [p_size - 1:0] Pre_out, emiss_out, trans_out, pre_pos_out, hmm0, hmm1, hmm2, hmm3, hmm4, hmm5, hmm6, hmm7, hmm8, hmm9, hmm10;
    output [POS_num_bit - 1:0] trans_curr, pre_encode_out, hmm_pos, max_pindex, max_lastpos;
    output [POS_num - 1:0] hmm_preaddr, max_preaddr;

wire increment_enable_Words_control, increment_enable_Transition_control,
     increment_enable_Emission_control, S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2,
     S_posibility_0, S_posibility_1, RW_HMM_matrix, change_enable, choose_output, RW_Key_reg, decrement_enable,
     RW_Pre_Posibility, RW_Max_posibility, RW_Stack_POS, reset_Stack_POS,
     reset_Transition_control, reset_Emission_control;
wire err, endl, multiple_source, stack_empty; 
wire [word_num_bit - 1:0] k;
wire [POS_num_bit - 1:0] i, J;

assign j = J;
assign endline = endl;
assign error = err;
assign key = k;
assign multiple_s = multiple_source;
Controller control( .clk(clk), .reset(reset), .start(start), .error(err), .i(i), .multiple_source(multiple_source), 
                    .endline(endl), .key(k), .stack_empty(stack_empty), .state(state), 
                    .increment_enable_Words_control(increment_enable_Words_control),
                    .increment_enable_Transition_control(increment_enable_Transition_control),
                    .increment_enable_Emission_control(increment_enable_Emission_control), 
                    .RW_Key_reg(RW_Key_reg), .decrement_enable(decrement_enable),
                    .S_key_0(S_key_0), .S_key_1(S_key_1), 
                    .S_POS_HMM_0(S_POS_HMM_0), .S_POS_HMM_1(S_POS_HMM_1), .S_POS_HMM_2(S_POS_HMM_2), 
                    .S_posibility_0(S_posibility_0), .S_posibility_1(S_posibility_1), 
                    .RW_HMM_matrix(RW_HMM_matrix), .j(J),
                    .reset_Transition_control(reset_Transition_control), 
                    .reset_Emission_control(reset_Emission_control), 
                    .change_enable(change_enable), .choose_output(choose_output), 
                    .RW_Pre_Posibility(RW_Pre_Posibility),
                    .RW_Max_posibility(RW_Max_posibility), .RW_Stack_POS(RW_Stack_POS), .reset_Stack_POS(reset_Stack_POS)); 

datapath data(.clk(clk), .reset(reset), .increment_enable_Words_control(increment_enable_Words_control), 
                 .increment_enable_Emiss_control(increment_enable_Emission_control),
                 .increment_enable_Transition_control(increment_enable_Transition_control), 
                 
                 .reset_Transition_control(reset_Transition_control), 
                 .reset_Emission_control(reset_Emission_control),
                 .RW_Key_reg(RW_Key_reg), .decrement_enable(decrement_enable), 
                 .RW_Pre_Posibility(RW_Pre_Posibility),
                 .S_key_0(S_key_0), .S_key_1(S_key_1), .S_POS_HMM_0(S_POS_HMM_0), 
                 .S_POS_HMM_1(S_POS_HMM_1), .S_POS_HMM_2(S_POS_HMM_2),
                 .S_posibility_0(S_posibility_0), .S_posibility_1(S_posibility_1), .RW_HMM_matrix(RW_HMM_matrix), 
                 .change_enable(change_enable), .choose_output(choose_output),
                 .RW_Max_posibility(RW_Max_posibility), .RW_Stack_POS(RW_Stack_POS),
                 .error(err), .endline(endl), .i(i), .multiple_source(multiple_source), .stack_empty(stack_empty),
                 .reset_Stack_POS(reset_Stack_POS),
                 .final_POS(final_POS), .key(k), .done(done),
                 
                 .J(J), .Pre_out(Pre_out),
                 .word_out(word_out), .emiss_out(emiss_out), .trans_out(trans_out), .trans_curr(trans_curr),
                 .pre_encode_out(pre_encode_out), .pre_pos_out(pre_pos_out), 
                 .hmm0(hmm0), .hmm1(hmm1), .hmm2(hmm2), .hmm3(hmm3), .hmm4(hmm4), .hmm5(hmm5), .hmm6(hmm6), 
                 .hmm7(hmm7), .hmm8(hmm8), .hmm9(hmm9), .hmm10(hmm10),
                 .hmm_preaddr(hmm_preaddr), .hmm_pos(hmm_pos), 
                 .max_preaddr(max_preaddr), .max_pindex(max_pindex), .max_lastpos(max_lastpos));
endmodule