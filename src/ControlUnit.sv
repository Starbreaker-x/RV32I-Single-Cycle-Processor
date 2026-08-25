module CU( input logic [31:0] ALUResult , input logic [6:0] Op , input logic [2:0] funct3 , input logic funct7_5 , Zero ,
 output logic PCSrc, ALUSrc , output logic [2:0] ResultSrc , output logic MemWrite , RegWrite , output logic [2:0] ImmSrc, output logic [3:0] ALU_Control , output logic PCTSrc);

logic Branch;
logic [1:0] ALUOp;

Main_Decoder MD( Op , RegWrite , ALUSrc, MemWrite, ResultSrc , Branch , ImmSrc , ALUOp );
ALU_Decoder  AD( Op[5] , funct7_5 , ALUOp , funct3 , ALU_Control );

always_comb begin

//Encodings of PCSrc for B-type instructions, jal , and Jalr
if(Branch == 1'b0)
assign PCSrc = 1'b0;
else begin


if( Op == 99 )    begin
case(funct3)

3'b000: assign PCSrc = Zero ? 1'b1 : 1'b0;        //beq

3'b001: assign PCSrc = Zero ? 1'b0 : 1'b1;        //bne

3'b100: assign PCSrc = ALUResult[0] ? 1'b1 : 1'b0;   //blt

3'b101: assign PCSrc = ALUResult[0] ? 1'b0 : 1'b1;   //bge

3'b110: assign PCSrc = ALUResult[0] ? 1'b1 : 1'b0;   //bltu

3'b111: assign PCSrc = ALUResult[0] ? 1'b0 : 1'b1;   //bgeu

endcase

end
else
    assign PCSrc = 1'b1;
end

if( Op == 32'd103)
 PCTSrc = 1'b0;
 else
 PCTSrc = 1'b1;
end


endmodule