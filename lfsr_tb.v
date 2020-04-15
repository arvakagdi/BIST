module tb_ML_lfsr;
reg clock,reset;
wire [9:0] dt_out;
ML_lfsr lfsr1(dt_out, complete, reset, clock);
initial
begin
clock = 1'b0;
end
always
#5 clock = ~clock;
initial
begin
reset = 1'b1;
#10 reset = 1'b0;
end
endmodule
