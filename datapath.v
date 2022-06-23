module datapath (clk, reset, increment_enable_Words_control, 
                 increment_enable_Emiss_control,
                 increment_enable_Transition_control, 
                 reset_Transition_control, 
                 reset_Emission_control,
                 RW_Key_reg, decrement_enable, 
                  RW_Pre_Posibility,
                 S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2,
                 S_posibility_0, S_posibility_1, RW_HMM_matrix, 
                 change_enable, choose_output,
                 RW_Max_posibility, RW_Stack_POS, reset_Stack_POS,
                 error, endline, i, multiple_source, stack_empty, J,
                 final_POS, key, done,
                 
                 word_out, emiss_out, trans_out, trans_curr, Pre_out,
                 pre_encode_out, pre_pos_out, 
                 hmm0, hmm1, hmm2, hmm3, hmm4, hmm5, hmm6, hmm7, hmm8, hmm9, hmm10,
                 hmm_preaddr, hmm_pos, 
                 max_preaddr, max_pindex, max_lastpos
                 );


    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter w_bit = 8;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
    
    input clk, reset, increment_enable_Words_control,
                 increment_enable_Emiss_control,
                 increment_enable_Transition_control, 
                 RW_Key_reg, decrement_enable, 
                  RW_Pre_Posibility,
                 S_key_0, S_key_1, S_POS_HMM_0, S_POS_HMM_1, S_POS_HMM_2,
                 S_posibility_0, S_posibility_1, RW_HMM_matrix, 
                 change_enable, choose_output, reset_Stack_POS,
                 RW_Max_posibility, RW_Stack_POS, reset_Transition_control, 
                 reset_Emission_control;
    output       error, endline, multiple_source, stack_empty, done;
    output [POS_num_bit - 1:0] i, final_POS, J;
    output [word_num_bit - 1:0] key;
    
    output [word_num_bit - 1:0] word_out;
    output [p_size - 1:0] Pre_out, emiss_out, trans_out, pre_pos_out, hmm0, hmm1, hmm2, hmm3, hmm4, hmm5, hmm6, hmm7, hmm8, hmm9, hmm10;
    output [POS_num_bit - 1:0] trans_curr, pre_encode_out, hmm_pos, max_pindex, max_lastpos;
    output [POS_num - 1:0] hmm_preaddr, max_preaddr;
    
wire [POS_num - 1:0] pre_addr, change_pre_addr;   
wire [p_size - 1:0] P0, P1, P2, P3, P4, P5, 
P6, P7, P8 ,P9, P10;
tri [p_size - 1:0] posibility_HMM_matrix; 
wire multi_source, enable_Max_posibility, endl, clk;
wire [POS_num_bit - 1:0] POS_HMM_matrix_out, chose_index, change_p_index, 
j, POS_Emission_matrix_in, current_POS_in, pre_addr_HMM_matrix_in;
wire [word_num_bit - 1:0] key_0, key_1, 
word_Words_input_in;
wire [w_bit - 1:0] word_Emission_matrix;
tri [word_num_bit - 1:0] key_HMM_matrix;
wire [POS_num_bit - 1:0] POS_HMM_0, POS_HMM_1, POS_HMM_2;
tri [POS_num_bit - 1:0] POS_HMM;
wire [p_size - 1:0] posibility_0, posibility_1, emiss_p, trans_p, P_out;
wire increment_enable_Emission_control, RW_HMM;

assign endline = endl;
assign key = key_0;

assign increment_enable_Emission_control = increment_enable_Emiss_control | (j == 10);
assign i = POS_Emission_matrix_in;
assign chose_index = j;

assign multiple_source = multi_source;
assign enable_Max_posibility = endl | multi_source;

assign posibility_HMM_matrix = S_posibility_0 ? posibility_0 : 
S_posibility_1 ? posibility_1 : 32'bz;

assign key_HMM_matrix = S_key_0 ? key_0 : S_key_1 ? key_1 : 8'bz;
assign POS_HMM = S_POS_HMM_0 ? POS_HMM_0 : S_POS_HMM_1 ? POS_HMM_1 : 
S_POS_HMM_2 ? POS_HMM_2 : 4'bz;

assign RW_HMM = RW_HMM_matrix;
               
assign word_out = word_Emission_matrix;
assign emiss_out = emiss_p;
assign trans_out = trans_p;
assign trans_curr = POS_HMM_0;
assign pre_encode_out = POS_HMM_1;
assign pre_pos_out = P_out;
assign hmm0 = P0;
assign hmm1 = P1;
assign hmm2 = P2;
assign hmm3 = P3;
assign hmm4 = P4;
assign hmm5 = P5;
assign hmm6 = P6;
assign hmm7 = P7;
assign hmm8 = P8;
assign hmm9 = P9;
assign hmm10 = P10;
assign hmm_preaddr =  pre_addr; 
assign hmm_pos = POS_HMM_matrix_out;
assign max_preaddr = change_pre_addr;
assign max_pindex = change_p_index;
assign max_lastpos = POS_HMM_2;
assign Pre_out = P_out;
assign J = j;
    
Words_control d0(.clk(clk), .reset_Words_control(reset), 
.increment_enable_Words_control(increment_enable_Words_control), 
.word_Words_control_out(word_Words_input_in));

Words_input d1(.word_Words_input_in(word_Words_input_in), .endline(endl), 
.word_Words_input_out(word_Emission_matrix), .key_Words_input(key_1), .error(error));

Key_reg d6(.clk(clk), .reset(reset), .RW_Key_reg(RW_Key_reg),
.key_Key_reg(key_1), .decrement_enable(decrement_enable), .key_o(key_0));


Emiss_control d2(.clk(clk), .reset_Emiss_control(reset_Emission_control), 
.increment_enable_Emiss_control(increment_enable_Emission_control), 
.POS_Emiss_control_out(POS_Emission_matrix_in));

Emission_matrix d3(.word_Emission_matrix(word_Emission_matrix), 
.POS_Emission_matrix_in(POS_Emission_matrix_in), .emiss_p(emiss_p), 
.POS_Emission_matrix_out(current_POS_in));


Transition_control d4(.clk(clk), .reset_Transition_control(reset_Transition_control), 
.increment_enable_Transition_control(increment_enable_Transition_control), 
.POS_Transition_control_out(j));

Transition_matrix d5(.previous_POS_in(j), .current_POS_in(current_POS_in), 
.trans_p(trans_p), .previous_POS_out(pre_addr_HMM_matrix_in), 
.current_POS_out(POS_HMM_0));    


Multiply m0(.a(emiss_p), .b(trans_p), .result(posibility_1));

Multiply m1(.a(posibility_1), .b(P_out), .result(posibility_0));  
  
    
Pre_addr_encode d7(.clk(clk), .pre_addr_Pre_addr_encode_in(pre_addr), .reset(reset), 
 .pre_addr_Pre_addr_encode_out(POS_HMM_1));
 
Pre_Posibility d8(.P0(P0), .P1(P1), .P2(P2), .P3(P3), 
.P4(P4), .P5(P5), .P6(P6), .P7(P7), .P8(P8) , .P9(P9), .P10(P10), 
.RW_Pre_Posibility(RW_Pre_Posibility), .reset(reset), .clk(clk), 
.chose_index(chose_index), .P_out(P_out)); 


HMM_matrix d9(.key_HMM_matrix(key_HMM_matrix), .POS(POS_HMM), 
.posibility(posibility_HMM_matrix), .pre_addr_HMM_matrix_in(pre_addr_HMM_matrix_in),
 .RW_HMM_matrix(RW_HMM), .reset(reset), .clk(clk), .change_pre_addr(change_pre_addr), 
.change_p_index(change_p_index), .change_enable(change_enable), 
.choose_output(choose_output), .P0(P0), .P1(P1), .P2(P2), .P3(P3), 
.P4(P4), .P5(P5), .P6(P6), .P7(P7), .P8(P8) , .P9(P9), .P10(P10), 
.pre_addr_HMM_matrix_out(pre_addr), .POS_HMM_matrix_out(POS_HMM_matrix_out));


Multiple_source_check d10(.pre_addr_Multiple_source_check_in(pre_addr), 
.multiple_source(multi_source));

Max_posibility d11(.clk(clk), .enable(enable_Max_posibility), 
.RW_Max_posibility(RW_Max_posibility), .reset(reset),
.P0(P0), .P1(P1), .P2(P2), .P3(P3), .P4(P4), .P5(P5), .P6(P6), 
.P7(P7), .P8(P8) , .P9(P9), .P10(P10),
.new_pre_addr(change_pre_addr), .max_index(change_p_index), 
.last_POS(POS_HMM_2), .max_pos());


Stack_POS d12(.reset(reset_Stack_POS), .CLK(clk), .RW_Stack_POS(RW_Stack_POS), 
.POS_Stack(POS_HMM_matrix_out), .final_POS(final_POS), .stack_empty(stack_empty), .done(done),
.addr());
    
endmodule 
