module seven_segment (
input clk,
input rst,
input [3:0]in,
output reg [6:0]out
);


// HEX out - rewire DE2
//  ---a---
// |       |
// f       b
// |       |
//  ---g---
// |       |
// e       c
// |       |
//  ---d---
	always @(posedge clk or posedge rst)
	begin
		if (rst == 1'b1)
			begin
				out = ~7'b1111110;
			end
		else
			begin
			case (in)	    // abcdefg
				4'h0: out = ~7'b1111110;
				4'h1: out = ~7'b0110000;
				4'h2: out = ~7'b1101101;
				4'h3: out = ~7'b1111001;
				4'h4: out = ~7'b0110011;
				4'h5: out = ~7'b1011011;
				4'h6: out = ~7'b1011111;
				4'h7: out = ~7'b1110000;
				4'h8: out = ~7'b1111111;
				4'h9: out = ~7'b1111011;
//				4'ha: out = 7'b1110111;
//				4'hb: out = 7'b0011111;
//				4'hc: out = 7'b1001110;
//				4'hd: out = 7'b0111101;
//				4'he: out = 7'b1001111;
//				4'hf: out = 7'b1000111;
			
				default: out = ~7'b1001111;
			
			endcase
			end
		end

endmodule