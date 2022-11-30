module check_hit(
	input [1:0] random_num, 
	input button1,
	input button2,
	input button3,
	input button4,
	output reg [3:0] lights,
	output reg give_point_life	//if 1'b1 then give point if 1'b0 lose life);
);
	
	
always@(*)
	begin
		if (random_num == 2'b00)
			begin
				lights[0] = 1'b1;
				
				if (button1 == 1'b0 && lights[0] == 1'b1)
					begin
					give_point_life = 1'b1;
					lights[0] = 1'b0;
					end
				else
					give_point_life = 1'b0;
			end
			
		else if (random_num == 2'b01)
			begin
				lights[1] = 1'b1;
				
				if (button2 == 1'b0 && lights[1] == 1'b1)
					begin
					give_point_life = 1'b1;
					lights[1] = 1'b0;
					end
				else
					give_point_life = 1'b0;
			
			end
			
		else if (random_num == 2'b10)
			begin
				lights[2] = 1'b1;
				
				if (button3 == 1'b0 && lights[2] == 1'b1)
					begin
					give_point_life = 1'b1;
					lights[2] = 1'b0;
					end
				else
					give_point_life = 1'b0;			
			
			end
			
		else if (random_num == 2'b11)
			begin
				lights[3] = 1'b1;
				
				if (button4 == 1'b0 && lights[3] == 1'b1)
					begin
					give_point_life = 1'b1;
					lights[3] = 1'b0;
					end
				else
					give_point_life = 1'b0;			
			
			end
	
	
	
	
	
	
	end
endmodule