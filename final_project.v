module final_project(

	input clk,
	input rst,
	input start,
	input button1,
	input button2,
	input button3,
	input button4,
	output reg [3:0] lights,
	output reg done,
	output reg [6:0]sevsegones,
	output reg [6:0]sevsegtens
);

reg [3:0] S;
reg [3:0] NS;
reg [1:0]give_lose_point;
wire [3:0]random_gen;
reg [1:0]random_num;
reg [3:0] point;
reg start_checks;
reg start_clock;
reg clock_done;
reg button_down;

parameter START = 4'b0000,
			 Gen_Num = 4'b0001,
			 Wait = 4'b0010,
			 hit = 4'b0011,
			 missed = 4'b0100,
			 finish = 4'b0101,
			 real_start = 4'b0111,
			 reset_state = 4'b1000;
			 
			 
lfsr random_num_gen(random_gen, clk, rst);			 
check_hit checker(random_num, start_checks, clk, rst, button1, button2, button3, button4, lights, give_lose_point, clock_done, button_down);
timer timing(clk, start_clock, clock_done);
seven_segment ones(point%10, sevsegones);
seven_segment tens(point/10, sevsegtens);

always @(posedge clk or posedge rst)
begin
	if (rst == 1'b1)
		begin
			S <= START;
		end
	else
		begin
			S <= NS;
		end
end
			 
always@(*)
	begin
		case(S)
			START:
				begin
					if(start == 1'b1)
						NS = real_start;
					else
						NS = START;
					end
			Gen_Num: 
				NS = Wait;
			Wait:
				begin
					if(give_lose_point == 2'b11)
						NS = hit;
					else if (give_lose_point == 2'b01)
						NS = missed;
				end
			hit:
				begin
					//if(point == 2'd10)
					//	NS = finish;
					//else
					if (button_down == 1'b0)
						NS = reset_state;
				end
			missed:
				begin
					if (button_down == 1'b0)
						NS = reset_state;
				end
			finish:
				begin
				end
			real_start:
				begin
					NS = Gen_Num;
				end
			reset_state:
				begin
					NS = Gen_Num;
				end
		endcase
	end
	
	
always@(posedge clk or posedge rst)

	begin
			
		case(S)
				START:
					begin 
						point <= 4'b0000;
						start_checks <= 1'b0;
						start_clock <= 1'b0;
						done <= 1'b0;
					end
				Gen_Num:
					begin
						random_num <= random_gen[1:0];

					end
				Wait:
					begin
						start_checks <= 1'b1;
						start_clock <= 1'b1;
					end
				hit:
					begin
						point <= point + 1'b1;
					end
				missed:
					begin
						//point <= 1'b0;
					end
				finish:
					begin
						done <= 1'b1;
					end
				real_start:
					begin
						done <= 1'b0;
					end
				reset_state:
					begin
						start_checks <= 1'b0;
						start_clock <= 1'b0;
					end
		endcase
			
	end


	
	
endmodule
			
				






	