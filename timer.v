module timer(clk, start_clock, clock_done);
input clk;
input start_clock;
output reg clock_done;



parameter N = 26;
reg [N-1:0] slow_clock = 0;

always @ (posedge clk)
	begin
		if (start_clock == 1'b1 & slow_clock != 26'b1111111111111111111111111111)
			begin
				slow_clock <= slow_clock + 1'b1;
				clock_done = 1'b0;

			end
		else
			begin
				slow_clock = 26'b00000000000000000000000000;
				clock_done = 1'b1;
			end
	end
	 
	 
	 
endmodule