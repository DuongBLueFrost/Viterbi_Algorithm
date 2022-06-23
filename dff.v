module dff (
      input clk, d, reset,
      output reg q
  );
  always @(posedge clk or reset) begin
      if(reset)
          q <= d;
      else 
          q <= 0;
  end
endmodule
