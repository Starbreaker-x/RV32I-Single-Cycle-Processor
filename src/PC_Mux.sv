//Mux that decides the input of PCNext based on the two adders PCTarget and PCPlus4


module PC_Mux(input [31:0] PCPlus4, PCTarget, input logic PCSrc, output logic [31:0] PCNext);

assign PCNext = PCSrc ? PCTarget : PCPlus4;

endmodule