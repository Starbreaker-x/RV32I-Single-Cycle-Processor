module RV32I_tb();

logic clk;
logic reset;

logic [31:0] PC;

RV32I_SC dut( clk , reset , PC);

always #5 clk = ~clk;

initial begin

reset = 1'b1;
@(posedge clk);
@(negedge clk);
reset = 1'b0;




end





endmodule