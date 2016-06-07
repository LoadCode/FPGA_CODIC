module generador(clk, Xout, Yout);
	
	localparam  SZ = 16; // bits of accuracy
	input wire clk;
	

	reg  signed [SZ-1:0] Xin = 19429;
   reg  signed [SZ-1:0] Yin = 1'd0;
	output wire signed [SZ:0] Xout, Yout;
	wire  signed [31:0] angle_tab;
	reg [8:0] i = 9'b000000000;  //variable de 9 bits para tomar valores de 0 a +359
	wire signed [31:0] angle_table [0:360];
	
	rom rom_angle(.clk(clk),.addr(i), .data(angle_tab));
	
		always @(negedge clk)  begin
			if(i == 359)
				i = 9'b000000000;
			i = i + 1;
		end
	
	//CORDIC (clock, angle, Xin, Yin, Xout, Yout);
		CORDIC sen_cos(.clock(clk), .angle(angle_tab),.Xin(Xin), .Yin(Yin), .Xout(Xout), .Yout(Yout));
	


endmodule

