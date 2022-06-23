module test_Viterbi ();
  
    parameter word_num = 16;
    parameter word_num_bit = 4;
    parameter p_size = 32;
    parameter POS_num = 11;
    parameter POS_num_bit = 4;
    
    reg clk, reset, start;
    wire error, endline, done/*, multiple_s*/;
    wire [word_num_bit - 1:0] key;
    wire [POS_num_bit - 1:0] final_POS/*, state, i, j*/;
    
    /*wire [word_num_bit - 1:0] word_out;
    wire [p_size - 1:0] Pre_out, emiss_out, trans_out, pre_pos_out, hmm0, hmm1, hmm2, hmm3, hmm4, hmm5, hmm6, hmm7, hmm8, hmm9, hmm10;
    wire [POS_num_bit - 1:0] trans_curr, pre_encode_out, hmm_pos, max_pindex, max_lastpos;
    wire [POS_num - 1:0] hmm_preaddr, max_preaddr;*/
    
initial begin
    clk <= 0;
    start <= 0;
    reset <= 1;
    fork
        #4 reset <= ~reset;
        #12 reset <= ~reset;
        #14 start <= ~start;
        #20 start <= ~start;
    join
end

always begin 
    #5 clk <= ~clk;
end

Viterbi v(.clk, .reset, .start, /*.state,*/ .key, .error, .endline, .final_POS, .done/*,
          .i, .j,
                 .word_out, .emiss_out, .trans_out, .trans_curr, .Pre_out,
                 .pre_encode_out, .pre_pos_out, 
                 .hmm0, .hmm1, .hmm2, .hmm3, .hmm4, .hmm5, 
                 .hmm6, .hmm7, .hmm8, .hmm9, .hmm10,
                 .hmm_preaddr, .hmm_pos, 
                 .max_preaddr, .max_pindex, .max_lastpos, .multiple_s*/);

endmodule
