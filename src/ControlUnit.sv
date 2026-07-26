module CU( input logic [6:0] Op , input logic [2:0] funct3 , input logic funct7_5 , Zero
 output logic PCSrc, ALUSrc , ResultSrc , MemWrite , RegWrite , output logic [1:0] ImmSrc, output logic [3:0] ALU_Control);

logic Branch;
logic [1:0] ALUOp;

Main_Decoder( Op , RegWrite , ALUSrc, MemWrite, ResultSrc , Branch , ImmSrc , ALUOp );
ALU_Decoder( Op[5] , funct7_5 , ALUOp , funct3 , ALU_Control );



assign PCSrc = Zero & Branch;


endmodule