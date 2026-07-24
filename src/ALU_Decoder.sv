module ALU_Decoder(input logic Op, funct7,
input logic [1:0] ALUOp, input logic [2:0] funct3, output logic ALU_Control);

case(ALUOp)

00: ALU_Control = 3'b000; // lw/sw

01: ALU_Control = 3'b001; // beq


10:  begin  // ALUOp 10 dictates an R-type instruction

case(funct3)

000: begin

if( Op && funct7){
    ALU_Control = 3'b001; //sub
}else{
    ALU_Control = 3'b000; //add
}

end

010: ALU_Control = 3'b101; //slt

110: ALU_Control = 3'b011; //or

111: ALU_Control = 3'b010; //and

// Still need SLTU , XOR, SLL, SRL, SRA


endcase

end


endmodule