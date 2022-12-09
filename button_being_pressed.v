module button_being_pressed(
input clk,
input button1,
input button2,
input button3,
input button4,
output reg holding_down
);



always@(posedge clk)
	begin
		if (button1 == 1'b0 | button2 == 1'b0 | button3 == 1'b0 | button4 == 1'b0)
			holding_down = 1'b1;
		else
			holding_down = 1'b0;
	end
	
endmodule