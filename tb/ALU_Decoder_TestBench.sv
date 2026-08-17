module AD_tb();

logic Op_5, funct7_5;
logic [1:0] ALUOp;
logic[2:0] funct3;
logic[3:0] ALU_Control;

ALU_Decoder dut( Op_5 , funct7_5 , ALUOp , funct3 , ALU_Control );

task check(input logic [3:0] ALU_Control_exp, input  string testname);

if( ALU_Control !== ALU_Control_exp) begin
    $display(" %s failed, ALU_control is: %b , expected: %b", testname , ALU_Control , ALU_Control_exp);
    $finish;
end
else
    $display(" %s test passed", testname);

endtask



initial begin


ALUOp = 2'b00;
#2;
check(4'b0000, "load/store instructions");


//Branching Instructions
ALUOp = 2'b01; funct3 = 3'b000;
#2;
check(4'b0001, "beq");

funct3 = 3'b001;
#2;
check(4'b0001, "bne");

funct3 = 3'b100;
#2;
check(4'b0101, "blt");

funct3 = 3'b101;
#2;
check(4'b0101, "bge");

funct3 = 3'b110;
#2;
check(4'b0110, "bltu");

funct3 = 3'b111;
#2;
check(4'b0110, "bgeu");


// R-type instructions

ALUOp = 2'b10; funct3 = 3'b000; Op_5 = 1'b1; funct7_5 = 1'b1;
#2
check(4'b0001, "sub");

//The three casses for add
Op_5 = 1'b0;
#2;
check(4'b0000, "add_01");

funct7_5 = 1'b0;
#2;
check(4'b0000, "add_00");

Op_5 = 1'b1; funct7_5 = 1'b0;
#2;
check(4'b0000, "add_10");

funct3 = 3'b010;
#2;
check(4'b0101, "slt");

funct3 = 3'b110;
#2;
check(4'b0011, "or");

funct3 = 3'b111;
#2;
check(4'b0010, "and");

funct3 = 3'b100;
#2;
check(4'b0100, "xor");

funct3 = 3'b011;
#2;
check(4'b0110, "sltu");

funct3 = 3'b001;
#2;
check(4'b0111, "SLL");

funct3 = 3'b101; funct7_5 = 1'b1;
#2;
check(4'b1001, "SRA");

funct7_5 = 1'b0;
#2;
check(4'b1000, "SRL");

$display("All tests passed");
$finish;
end


endmodule