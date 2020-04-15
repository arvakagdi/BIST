
module ML_lfsr(data_out,complete,reset,clock);
input reset;
input clock;
output [9:0] data_out; output complete;
reg complete; reg [9:0] lfsr_reg;
reg [9:0] counter; reg tap;
always@(posedge clock or posedge reset)
begin
if(reset == 1)
begin
lfsr_reg <= 10'b1111111111;
counter <= 10'b0000000000;
end
else
begin
tap = lfsr_reg[9] ^ lfsr_reg[6];
lfsr_reg[9:0] <= { lfsr_reg[8:0], tap };
counter = counter + 1;
if(counter < 10'b1111111110)
complete = 0;
else
complete = 1;
end
end
assign data_out = lfsr_reg;
endmodule