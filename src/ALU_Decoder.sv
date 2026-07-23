module ALU_Decoder(input logic Op, funct7,
input logic [1:0] ALUOp, input logic [2:0] funct3, output logic ALU_Control);

case(ALUOp)

00: ALU_Control = 3'b000;

01: ALU_Control = 3'b001;


10:  begin



















    






end


endcase















endmodule