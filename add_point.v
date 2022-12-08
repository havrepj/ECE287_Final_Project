module add_point(
input clk,
input rst,
input up_down,
output reg [3:0]point);



always@(posedge clk or posedge rst)
	begin
		if (rst == 1'b1)
			begin
			point <= 4'b0000;
			end
		else if (up_down == 1'b1)
			begin
			point <= point + 1'b1;
			end
	end
	
endmodule