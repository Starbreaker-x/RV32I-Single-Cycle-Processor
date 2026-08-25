module PCT_Mux( input logic [4:0] rs1 , input logic [31:0] PC, input logic PCTSrc , output logic [31:0] Result );

assign Result = PCTSrc ?  PC : rs1 ;

endmodule