module top_1(
    input clk, d, set, enable, 
    output [5:0] q
);

wire [5:0]co;
wire [5:0]db;

has h1(.en(enable), .d(d), .qi(q[0]), .ci(enable), .co(co[0]), .do(db[0]));
has h2(.en(enable), .d(d), .qi(q[1]), .ci(co[0]), .co(co[1]), .do(db[1]));
has h3(.en(enable), .d(d), .qi(q[2]), .ci(co[1]), .co(co[2]), .do(db[2]));
has h4(.en(enable), .d(d), .qi(q[3]), .ci(co[2]), .co(co[3]), .do(db[3]));
has h5(.en(enable), .d(d), .qi(q[4]), .ci(co[3]), .co(co[4]), .do(db[4]));
has h6(.en(enable), .d(d), .qi(q[5]), .ci(co[4]), .co(co[5]), .do(db[5]));

d_ff d1(.clk(clk), .clear(1), .d(db[0]), .q(q[0]), .preset(set));
d_ff d2(.clk(clk), .clear(1), .d(db[1]), .q(q[1]), .preset(set));  
d_ff d3(.clk(clk), .clear(1), .d(db[2]), .q(q[2]), .preset(set));
d_ff d4(.clk(clk), .clear(1), .d(db[3]), .q(q[3]), .preset(set));  
d_ff d5(.clk(clk), .clear(1), .d(db[4]), .q(q[4]), .preset(set));   
d_ff d6(.clk(clk), .clear(1), .d(db[5]), .q(q[5]), .preset(set)); 
endmodule

