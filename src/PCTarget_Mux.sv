module PCT_Mux( input logic [4:0] rs1 , input logic [31:0] PC, input logic [1:0] PCTSrc , output logic [31:0] Result );

assign Result = PCTSrc[1] ?  32'd0 : (PCTSrc[0] ?  PC : rs1 );

endmodule