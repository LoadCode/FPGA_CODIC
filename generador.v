module generador(clk);

	input wire clk;
	localparam  SZ = 16; // bits of accuracy

	reg  [SZ-1:0] Xin, Yin;
	reg  [31:0] angle;
	wire [SZ:0] Xout, Yout;
	
	wire signed [31:0] angle_table [0:359];
	//CORDIC (clock, angle, Xin, Yin, Xout, Yout);
		CORDIC sen_cos(.clock(clk), )
	
endmodule

