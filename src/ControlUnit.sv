module CU( input logic [6:0] Op , input logic [2:0] funct3 , input logic funct7_5 , Zero ,
 output logic PCSrc, ALUSrc , ResultSrc , MemWrite , RegWrite , output logic [1:0] ImmSrc, output logic [3:0] ALU_Control);

logic Branch;
logic [1:0] ALUOp;

Main_Decoder MD( Op , RegWrite , ALUSrc, MemWrite, ResultSrc , Branch , ImmSrc , ALUOp );
ALU_Decoder  AD( Op[5] , funct7_5 , ALUOp , funct3 , ALU_Control );


if( Branch == 32'd0)
assign PCSrc = 1'b0;
else begin

case(funct3)

3'b000: assign PCSrc = Zero ? 1'b1 : 1'b0;   //beq

3'b001: assign PCSrc = Zero ? 1'b0 : 1'b1;   //bne

3'b100: assign PCSrc = Zero ?                                     //btl

3'b101: assign PCSrc = Zero ?                                     //bge

3'b110: assign PCSrc = Zero ?                                     //btlu

3'b111: assign PCSrc = Zero ?                                    //bgeu


endcase


end

assign PCSrc = Zero & Branch;


endmodule