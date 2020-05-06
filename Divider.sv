module Divider(input logic Clk, start,
				   input logic [15:0] DIVIDER, DIVIDEND,
					output logic [15:0] quotient, remainder,
					output logic ready,
					output logic [4:0] bitt);
					
			logic[31:0] dividend_copy, divider_copy, diff;
			assign remainder = dividend_copy[15:0];
			
			assign ready = !bitt;
			initial bitt = 0; //
			assign active = 0; //indicates if the divider is running
			
			always @(posedge Clk) begin
				if (ready && start) begin
					bitt <= 16;
					quotient <= 0;
					dividend_copy = {16'd0, DIVIDEND};
					divider_copy = {1'b0, DIVIDER, 15'd0};
				end
				
				else if (!ready) begin
					diff = dividend_copy - divider_copy;
					quotient = quotient << 1;
					if (!diff[31]) begin
						dividend_copy = diff;
						quotient[0] = 1'd1;
					end
					
					divider_copy = divider_copy >> 1;
					bitt = bitt - 1;
					
				end
				end
	endmodule
					
					
					
		