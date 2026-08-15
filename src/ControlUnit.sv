module CU( input logic [31:0] ALUResult , input logic [6:0] Op , input logic [2:0] funct3 , input logic funct7_5 , Zero ,
 output logic PCSrc, ALUSrc , ResultSrc , MemWrite , RegWrite , output logic [2:0] ImmSrc, MemWidth, output logic [3:0] ALU_Control);

logic Branch;
logic [1:0] ALUOp;

Main_Decoder MD( Op , RegWrite , ALUSrc, MemWrite, ResultSrc , Branch , ImmSrc , ALUOp );
ALU_Decoder  AD( Op[5] , funct7_5 , ALUOp , funct3 , ALU_Control );

always_comb begin

//Encodings of PCSrc for B-type instructions    
if(Branch == 1'b0)
assign PCSrc = 1'b0;
else begin

case(funct3)

3'b000: assign PCSrc = Zero ? 1'b1 : 1'b0;        //beq

3'b001: assign PCSrc = Zero ? 1'b0 : 1'b1;        //bne

3'b100: assign PCSrc = ALUResult[0] ? 1'b1 : 1'b0;   //blt

3'b101: assign PCSrc = ALUResult[0] ? 1'b0 : 1'b1;   //bge

3'b110: assign PCSrc = ALUResult[0] ? 1'b1 : 1'b0;   //bltu

3'b111: assign PCSrc = ALUResult[0] ? 1'b0 : 1'b1;   //bgeu

endcase

end




/*Encodings of MemWidth for S-type and I-type load instructions*/

/* MemWidth = 00 , 32-bit width
   
   MemWidth = 01 , 16-bit width

   MemWidth = 10 ,  8-bit width
                                   */

if( Op = 7'd3 ) begin // I-type

case( funct3 )


3'b000: assign MemWidth = 2'b01; // lb

3'b001: assign MemWidth = 2'b10; // lh

3'b010: assign MemWidth = 2'b00; // lw

3'b100: assign MemWidth = 2'b01; // lbu

3'b101: assign MemWidth = 2'b10; // lhu

default: 3'bxxx;

endcase

end





if( Op = 7'd35 ) begin //S-type

case( funct3 )

3'b000: assign MemWidth = 2'b01; // sb

3'b001: assign MemWidth = 2'b10; // sh

3'b010: assign MemWidth = 2'b00; // sw


endcase

end


end


endmodule