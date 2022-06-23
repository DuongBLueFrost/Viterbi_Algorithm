module d_latch(
	input D,C,
	output Q
);

	wire a,b,d;
	
	and a1(a,~D,C);
	and a2(b,D,C);
	nor n1(Q,a,d);
	nor #1 n2(d,b,Q);
endmodule

