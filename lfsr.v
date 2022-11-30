module lfsr(out, clk, rst);

	output reg[1:0] out;
	input clk, rst;
	
	wire fb;
	assign fb = ~(out[1] ^ out[0]);
	
	always@(posedge clk, posedge rst)
	
		begin
		
			if(rst) 
				out = 2'b0;
			else
				out = {out[1:0], fb};
		
		end
		
endmodule
			

