module final_project(

	input clk,
	input rst,
	input start,
	input button1,
	input button2,
	input button3,
	input button4,
	
	output [3:0] lights,
	output reg [3:0] point,
	output reg [1:0] lives,
	output reg done

);

reg [3:0] S;
reg [3:0] NS;
reg check;
wire [1:0]random_number;

parameter START = 4'b0000,
			 Gen_Num = 4'b0001,
			 Wait = 4'b0010,
			 hit = 4'b0011,
			 missed = 4'b0100,
			 finish = 4'b0101;
			 
			 
lfsr random_num_gen(random_number, clk, rst);			 
check_hit checker(random_number, button1, button2, button3, button4, lights, check);
			 
always@(*)
	begin
		case(S)
			START:
				begin
					if(start == 1'b1)
						NS = Gen_Num;
					else
						NS = START;
					end
			Gen_Num: 
				NS = Wait;
			Wait:
				begin
					if(check == 1'b1)
						NS = hit;
					else
						NS = missed;
				end
			hit:
				begin
					if(point == 2'd10)
						NS = finish;
					else
						NS = Gen_Num;
				end
			missed:
				begin
					if(lives == 1'd3)
						NS = finish;
					else
						NS = Gen_Num;
				end
			finish:
				begin
				end
		endcase
	end
	
	
always@(posedge clk or posedge rst)

	begin
		if(rst == 1'b1)
			begin
				point = 4'b0000;
				lives = 2'b11;
			end
		else 
			case(S)
				START:
					begin 
						done <= 1'b0;
					end
				Gen_Num:
					begin
						//Generate Randome Number
					end
				Wait:
					begin
						//check for hit or miss
					end
				hit:
					begin
						point = point + 1'b1;
					end
				missed:
					begin
						lives = lives - 1'b1;
					end
				finish:
					begin
					end
			endcase
			
	end
	
endmodule
			
				






	