module SrcB_Mux(input logic [31:0] RD2, ImmExt, input logic ALUSrc, output logic SrcB);

assign SrcB = ALUSrc ? ImmExt : RD2;

endmodule