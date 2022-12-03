module timer(clk, start_clock, clock_done);
input clk;
input start_clock;
output reg clock_done;



parameter N = 26;
reg [N-1:0] slow_clock = 0;

always @ (posedge clk)
	begin
		if (start_clock == 1'b1)
			begin
				slow_clock <= slow_clock + 1'b1;
					if (slow_clock > 26'b1100000000000000000000000000) // 11111111111111111111111111
						begin
						clock_done = 1'b1;
						end
			end
		else if (start_clock == 1'b0)
			begin
				slow_clock = 26'b00000000000000000000000000;
				clock_done = 1'b0;
			end
	end
	 
	 
	 
endmodule