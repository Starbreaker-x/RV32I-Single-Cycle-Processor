module RV32I_tb();

logic clk = 0;
logic reset;

logic [31:0] PC;

RV32I_SC dut( clk , reset , PC);

always #5 clk = ~clk;

task check_r( input logic [31:0] expected , input logic [31:0] regnum,  input string instruction_name );

if( dut.RegisterFile.Registers[regnum] === expected )
$display("Register %d contains the value: %d , %s instruction passed", regnum, expected , instruction_name );
else begin
$display("Register %d contains the value: %d , expected: %d , %s instruction failed", regnum , dut.RegisterFile.Registers[regnum] , expected , instruction_name );
$finish;
end
endtask


task check_PC(input logic [31:0] expected);

if( PC !== expected ) begin
$display( "PC is: %h , expected: %h ", PC , expected );
$finish;
end
else
$display(" PC: %h ", PC );
endtask





initial begin

reset = 1'b1;
@(posedge clk);
#2;
reset = 1'b0;
check_PC(32'd0); 


@(posedge clk);
#2;
check_r( 32'd4 , 32'd1 , "addi" );
check_PC(32'd4); 

@(negedge clk);

@(posedge clk);
#2;;
check_r( 32'd15 , 32'd2 , "addi" );
check_PC(32'd8); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd8 , 32'd3 , "addi" );
check_PC(32'd12); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd2 , 32'd4 , "addi" );
check_PC(32'd16); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hF0000_000 , 32'd5 , "lui" );
check_PC(32'd20); 

@(negedge clk);


@(posedge clk);
#2;
check_r( 32'd4026531840 , 32'd5 , "ori" );
check_PC(32'd24); 


@(negedge clk);


@(posedge clk);
#2;
check_r( 32'd7 , 32'd6 , "addi" );
check_PC(32'd28); 


//R-type


@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd19 , 32'd7 , "add" );
check_PC(32'd32); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd11 , 32'd8 , "sub" );
check_PC(32'd36); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd7 , 32'd9 , "and" );
check_PC(32'd40); 
@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd6 , 32'd10 , "or" );
check_PC(32'd44);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd8 , 32'd11 , "xor" );
check_PC(32'd48); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd1 , 32'd12 , "slt" );
check_PC(32'd52);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd13, "slt" );
check_PC(32'd56); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd14 , "sltu" );
check_PC(32'd60); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd1 , 32'd15 , "sltu" );
check_PC(32'd64); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd16 , 32'd16 , "sll" );
check_PC(32'd68); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'h3C00_0000 , 32'd17 , "srl" );
check_PC(32'd72);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd2 , 32'd18 , "srl" );
check_PC(32'd76);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hFC00_0000 , 32'd19 , "sra" );
check_PC(32'd80); 


@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd2 , 32'd20 , "sra" );
check_PC(32'd84);


//Immediate instructions

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd21 , "slti");
check_PC(32'd88);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd21 , "slti");
check_PC(32'd92);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd22 , "sltiu");
check_PC(32'd96);


@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd21 , "sltiu");
check_PC(32'd100);




























































@(negedge clk);

//sw
@(posedge clk);
#2;
check_r( 32'd2 , 32'd20 , "sra" );
check_PC(32'd80);

@(negedge clk);

//beq no branch
@(posedge clk );
#2;
if( {dut.DataMemory.mem[27], dut.DataMemory.mem[26], dut.DataMemory.mem[25], dut.DataMemory.mem[24]} === 32'd16 )
$display( "sw instruction is functional ");
else begin
$display( " Address 24 containes: %d , expected: %d ", {dut.DataMemory.mem[27], dut.DataMemory.mem[26], dut.DataMemory.mem[25], dut.DataMemory.mem[24]} , 32'd16 );
$finish;
end
check_PC(32'd84);

@(negedge clk );

//beq that does branch, offset 8 so next PC should be 96
@(posedge clk );
#2;
check_PC(32'd88);

@(negedge clk);

//sub instruction skipped the add instruction
@(posedge clk);
#2;
check_PC(32'd96); 

@(negedge clk);
@(posedge clk);
#2;
check_r( 32'd5 , 32'd21 , "sub" );

$display( "All tests passed " );
$finish;

end





endmodule