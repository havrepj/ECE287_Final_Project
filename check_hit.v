module check_hit(
	input [1:0] random_num,
	input start_checks,
	input clk,
	input reset,
	input button1,
	input button2,
	input button3,
	input button4,
	output reg [3:0]lights,
	output reg [1:0]give_lose_point,//if 2'b11 then give point if 2'b01 lose life);
	input clock_done
);




	
always@(posedge clk or posedge reset)
	begin
		if (reset == 1'b1)
			begin
				give_lose_point <= 2'b00;
				lights[0] <= 1'b0;
				lights[1] <= 1'b0;
				lights[2] <= 1'b0;
				lights[3] <= 1'b0;
			end
			
		else
		begin
		if (start_checks == 1'b1)
			begin
				give_lose_point <= 2'b00;

				if (random_num == 2'b00)
				begin
					lights[0] <= 1'b1;
					lights[1] <= 1'b0;
					lights[2] <= 1'b0;
					lights[3] <= 1'b0;
					
					if (button1 == 1'b0)
						begin
							lights[0] <= 1'b0;
							give_lose_point <= 2'b11;
						end
					else if (button2 == 1'b0 | button3 == 1'b0 | button4 == 1'b0 | clock_done)
						begin
							lights[0] <= 1'b0;
							give_lose_point <= 2'b01;
						end
						
				end
				else if (random_num == 2'b01)
				begin
					lights[0] <= 1'b0;
					lights[1] <= 1'b1;
					lights[2] <= 1'b0;
					lights[3] <= 1'b0;
				
					if (button2 == 1'b0)
						begin
							lights[1] <= 1'b0;
							give_lose_point <= 2'b11;
						end
					else if (button1 == 1'b0 | button3 == 1'b0 | button4 == 1'b0 | clock_done)
						begin
							lights[1] <= 1'b0;
							give_lose_point <= 2'b01;
						end
				
				end
				else if (random_num == 2'b10)
				begin
					lights[0] <= 1'b0;
					lights[1] <= 1'b0;
					lights[2] <= 1'b1;
					lights[3] <= 1'b0;
				
					if (button3 == 1'b0)
						begin
							lights[2] <= 1'b0;
							give_lose_point <= 2'b11;
						end
					else if (button2 == 1'b0 | button1 == 1'b0 | button4 == 1'b0 | clock_done)
						begin
							lights[2] <= 1'b0;
							give_lose_point <= 2'b01;
						end		
			
				end
				else if (random_num == 2'b11)
				begin
					lights[0] <= 1'b0;
					lights[1] <= 1'b0;
					lights[2] <= 1'b0;
					lights[3] <= 1'b1;
				
					if (button4 == 1'b0)
						begin
							lights[3] <= 1'b0;
							give_lose_point <= 2'b11;
						end
					else if (button2 == 1'b0 | button3 == 1'b0 | button1 == 1'b0 | clock_done)
						begin
							lights[3] <= 1'b0;
							give_lose_point <= 2'b01;
						end			
			
				end
			end
			end

	end
	

	
	
endmodule