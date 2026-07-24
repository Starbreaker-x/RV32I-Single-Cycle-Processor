module ALU_Decoder(input logic Op, funct7,
input logic [1:0] ALUOp, input logic [2:0] funct3, output logic [3:0] ALU_Control);

case(ALUOp)

00: ALU_Control = 4'b0000; // lw/sw

01: ALU_Control = 4'b0001; // beq


10:  begin  // ALUOp 10 dictates an R-type instruction

case(funct3)

000: begin

if( Op && funct7)
    ALU_Control = 4'b0001; //sub
else
    ALU_Control = 4'b0000; //add
end

010: ALU_Control = 4'b0101; //slt

110: ALU_Control = 4'b0011; //or

111: ALU_Control = 4'b0010; //and

100: ALU_Control = 4'b0100; //xor

011: ALU_Control = 4'b0110; //sltu 

001: ALU_Control = 4'b0111; //SLL

101: begin

if(funct7)
    ALU_Control = 4'b1001; //SRA
else
    ALU_Control = 4'b1000; //SRL
end

endcase

end

endcase


endmodule