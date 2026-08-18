module Result_Mux(input logic [31:0] ALUResult, RD , ImmExt , PCPlus4 , PCTarget, input logic [2:0] ResultSrc, output logic [31:0] Result);



/*
ResultSrc Encodings

000: ALU Result

001: ReadData

010: PCPlus4

011: ImmExt

100: PCTarget


*/

always_comb begin

if(ResultSrc[2] == 1'b1)
Result = PCTarget; 
else
    Result = ResultSrc[1] ? ( ResultSrc[0] ? ImmExt : PCPlus4 ) : ( ResultSrc[0] ? RD : ALUResult );
end

endmodule