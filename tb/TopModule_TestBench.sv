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
check_r( 32'd1 , 32'd21 , "slti" );
check_PC(32'd88);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd21 , "slti" );
check_PC(32'd92);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd22 , "sltiu" );
check_PC(32'd96);


@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd1 , 32'd22 , "sltiu" );
check_PC(32'd100);


@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd0 , 32'd23 , "xori" );
check_PC(32'd104);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd128 , 32'd24, "slli" );
check_PC(32'd108);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'h3C00_0000 , 32'd17 , "srli" );
check_PC(32'd112);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd2 , 32'd18 , "srli" );
check_PC(32'd116);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hFC00_0000 , 32'd19 , "srai" );
check_PC(32'd120); 

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd2 , 32'd20 , "srai" );
check_PC(32'd124);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hF0000_000 , 32'd5 , "andi" );
check_PC(32'd128);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd132, 32'd8 , "jalr");
check_PC(32'd144);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd4240, 32'd9 , "auipc");
check_PC(32'd148);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'd152 , 32'd10 , "jal" );
check_PC(32'd156);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hFFFFF_000 , 32'd11 , "lui");
check_PC(32'd160);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hFFFF_FFFF , 32'd11 , "ori");
check_PC(32'd164);


//S-type instructions

@(negedge clk);

@(posedge clk);
#2;
if( {dut.DataMemory.mem[7], dut.DataMemory.mem[6], dut.DataMemory.mem[5], dut.DataMemory.mem[4]} === 32'hFFFF_FFFF )
$display( "sw instruction is functional ");
else begin
$display( " Address 4 containes: %h , expected: %h ", {dut.DataMemory.mem[7], dut.DataMemory.mem[6], dut.DataMemory.mem[5], dut.DataMemory.mem[4]} , 32'hFFFF_FFFF );
$finish;
end
check_PC(32'd168);

@(negedge clk);

@(posedge clk);
#2;
if( {dut.DataMemory.mem[11], dut.DataMemory.mem[10], dut.DataMemory.mem[9], dut.DataMemory.mem[8]} === 32'hxxxx_FFFF )
$display( "sh instruction is functional ");
else begin
$display( " Address 8 containes: %h , expected: %h ", {dut.DataMemory.mem[11], dut.DataMemory.mem[10], dut.DataMemory.mem[9], dut.DataMemory.mem[8]} , 32'hxxxx_FFFF );
$finish;
end
check_PC(32'd172);

@(negedge clk);

@(posedge clk);
#2;
if( {dut.DataMemory.mem[15], dut.DataMemory.mem[14], dut.DataMemory.mem[13], dut.DataMemory.mem[12]} === 32'hxxxx_xxFF )
$display( "sb instruction is functional ");
else begin
$display( " Address 12 containes: %h , expected: %h ", {dut.DataMemory.mem[15], dut.DataMemory.mem[14], dut.DataMemory.mem[13], dut.DataMemory.mem[12]} , 32'hxxxx_xxFF );
$finish;
end
check_PC(32'd176);

//Load instrucitions

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hFFFF_FFFF , 32'd12 , "lb" );
check_PC(32'd180);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hxxxx_xxFF , 32'd13 , "lh" );
check_PC(32'd184);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'h0000_00FF , 32'd14 , "lbu" );
check_PC( 32'd188);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'h0000_xxFF , 32'd15 , "lhu" );
check_PC(32'd192);

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'hxxxx_xxFF , 32'd16 , "lw" );
check_PC(32'd196);

//B-type instructions


//beq: not branch
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd200);

//beq: branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd208);

//bne: not branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd212);

//bne: branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd224);

//blt: not branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd228);

//blt: branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd232);

//bge: not branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd236);

//bge: branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd240);

//bltu: not branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd244);

//bltu: branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd248);

//bgeu: not branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd252);

//bgeu: branching
@(negedge clk);

@(posedge clk);
#2;
check_PC(32'd256);

//end of B-type instructions

@(negedge clk);

@(posedge clk);
#2;
check_r( 32'dx , 32'd0 , "add" );

 $display( "All tests passed");
 $finish;

end

endmodule