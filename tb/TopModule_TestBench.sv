module RV32I_tb();

logic clk = 0;
logic reset;

logic [31:0] PC;

RV32I_SC dut( clk , reset , PC);

always #5 clk = ~clk;

task check( input logic [31:0] expected , input logic [31:0] regnum,  input string instruction_name );

if( dut.RegisterFile.registers[regnum] === expected )
$display("Register %d contains the value: %d , %s instruction passed", regnum, expected , instruction_name );
else
$display("Register %d contains the value: %d , expected: %d , %s instruction failed", regnum , dut.RegisterFile.registers[regnum] , expected , instruction_name );

endtask





initial begin

reset = 1'b1;
@(posedge clk);
@(negedge clk);
reset = 1'b0;


@(posedge clk);
$display("PC: %h", PC); 


end





endmodule