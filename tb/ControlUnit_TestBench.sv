module CU_tb();

/* I'm going to verify that ALUOp gets passed out correctly from the Main to the ALU Decoder by seeing if ALU_Control is assigned the correct value
 ALso, I need to see if PCSrc was assinged the correct value from the and operation between Branch and Zero
          */



logic [6:0] Op;  logic [2:0] funct3;  logic funct7_5 , Zero , PCSrc , ALUSrc , ResultSrc , MemWrite , RegWrite;  logic [1:0] ImmSrc;  logic [3:0] ALU_Control;
logic [31:0] ALUResult;



CU dut( ALUResult , Op , funct3 , funct7_5 , Zero , PCSrc , ALUSrc , ResultSrc , MemWrite , RegWrite , ImmSrc , ALU_Control );


task check( input logic [3:0] ALU_Control_exp , input logic  PCSrc_exp , input string testname);

if( ALU_Control === ALU_Control_exp && PCSrc === PCSrc_exp)
$display(" %s test passed", testname);

if( ALU_Control !== ALU_Control_exp || PCSrc !== PCSrc_exp) begin

$display(" %s failed, ALU_Control is: %b , expected: %b , PCSrc is: %b , expected: %b ", testname , ALU_Control , ALU_Control_exp , PCSrc , PCSrc_exp );
$finish;

end

endtask






  initial begin        


//lw
Op = 7'b0000011; funct3 = 3'bxxx; funct7_5 = 1'bx; Zero = 1'b0;
#2;
check( 4'b0000 , 1'b0 , "lw" );


//sw
Op = 7'b0100011; funct3 = 3'bxxx; funct7_5 = 1'bx; 
#2;
check( 4'b0000 , 1'b0, "sw" ) ;


//B-type instructions



//beq

//Zero = 0
Op = 7'b1100011; funct3 = 3'b000;  funct7_5  =  1'bx;
#2;
check( 4'b0001 , 1'b0, "beq: Not Branching");


// Zero = 1
Zero = 1'b1;
#2;
check( 4'b0001 , 1'b1 , "beq: Branching");


//bne


//Zero = 1
funct3 = 3'b001; 
#2;
check( 4'b0001 , 1'b0, "bne: Not Branching");


// Zero = 0
Zero = 1'b0;
#2;
check( 4'b0001 , 1'b1 , "bne: Branching");



//blt


funct3 = 3'b100; ALUResult = 1'b0;
#2;
check( 4'b0101 , 1'b0, "blt: Not Branching");


ALUResult = 1'b1;
#2;
check( 4'b0101 , 1'b1 , "blt: Branching");



//bge

funct3 = 3'b101; ALUResult = 1'b1;
#2;
check( 4'b0101 , 1'b0, "bge: Not Branching");


ALUResult = 1'b0;
#2;
check( 4'b0101 , 1'b1 , "bge: Branching");



//bltu

funct3 = 3'b110; ALUResult = 1'b0;
#2;
check( 4'b0110 , 1'b0, "bltu: Not Branching");


ALUResult = 1'b1;
#2;
check( 4'b0110 , 1'b1 , "bltu: Branching");



//bge

funct3 = 3'b111; ALUResult = 1'b1;
#2;
check( 4'b0110 , 1'b0, "bgeu: Not Branching");


ALUResult = 1'b0;
#2;
check( 4'b0110 , 1'b1 , "bgeu: Branching");



//R-type instructions from now on, Op will be the same

//add
Op = 7'b0110011; funct3 = 3'b000; funct7_5 = 1'b0;
#2;
check( 4'b0000 , 1'b0 , "add" );




//sub
funct7_5 = 1'b1;
#2;
check( 4'b0001, 1'b0 , "sub");




//SRL
funct3 = 3'b101; funct7_5 = 1'b0;
#2
check( 4'b1000 , 1'b0 , "SRL");



//SRA
funct7_5 = 1'b1;
#2;
check( 4'b1001 , 1'b0 , "SRA");
$display("All tests passed");
$finish;
  end




endmodule