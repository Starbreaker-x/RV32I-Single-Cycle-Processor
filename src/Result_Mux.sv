module Result_Mux(input logic [31:0] ALUResult, RD, input logic ResultSrc, output logic [31:0] Result);

Result = ResultSrc ? RD : ALUResult ;

endmodule