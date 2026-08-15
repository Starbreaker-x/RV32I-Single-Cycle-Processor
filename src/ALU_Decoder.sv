module ALU_Decoder(input logic Op_5, funct7_5,
input logic [1:0] ALUOp, input logic [2:0] funct3, output logic [3:0] ALU_Control);



always_comb begin

case(ALUOp)

2'b00: ALU_Control = 4'b0000; // laod & S-type instructions

2'b01: begin // Branching instructions
    
    case(funct3)

    3'b000: ALU_Control = 4'b0001; //beq

    3'b001: ALU_Control = 4'b0001; //bne

    3'b100: ALU_Control = 4'b0101; //blt

    3'b101: ALU_Control = 4'b0101; //bge

    3'b110: ALU_Control = 4'b0110; //bltu

    3'b111: ALU_Control = 4'b0110; //bgeu

    endcase
    
end



2'b10:  begin  // ALUOp 10 dictates an R-type instruction

case(funct3)

3'b000: begin

if( Op_5 && funct7_5)
    ALU_Control = 4'b0001; //sub
else
    ALU_Control = 4'b0000; //add
end

3'b010: ALU_Control = 4'b0101; //slt

3'b110: ALU_Control = 4'b0011; //or

3'b111: ALU_Control = 4'b0010; //and

3'b100: ALU_Control = 4'b0100; //xor

3'b011: ALU_Control = 4'b0110; //sltu 

3'b001: ALU_Control = 4'b0111; //SLL

3'b101: begin

if(funct7_5)
    ALU_Control = 4'b1001; //SRA
else
    ALU_Control = 4'b1000; //SRL
end

endcase

end

endcase

end


endmodule