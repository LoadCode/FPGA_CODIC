`timescale 1 ns/100 ps

module generador_tb;

	parameter CLK100_SPEED = 10;  // 100Mhz = 10nS
	localparam  SZ = 16; // bits of accuracy
	wire [SZ:0] Xout, Yout;
	reg CLK_100MHZ = 1'b0;
	reg [31:0] i = 0;
	
	generador uut(.clk(CLK_100MHZ), .Xout(Xout), .Yout(Yout));
		
	always @(posedge CLK_100MHZ) begin
		if (i == 360) begin
			$write("Simulation has finished");
			$stop;
		end
		i = i+1;
 end
		
		

	initial
	begin
	  CLK_100MHZ = 1'b0;
	  $display ("CLK_100MHZ started");
	  #5;
	  forever
	  begin
		 #(CLK100_SPEED/2) CLK_100MHZ = 1'b1;
		 #(CLK100_SPEED/2) CLK_100MHZ = 1'b0;
	  end
	end

endmodule
