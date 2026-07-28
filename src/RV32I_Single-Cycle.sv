module RV32I_SC( input logic clk, reset, output logic [31:0] PC);

//PC is an output for testing purpouses in simulation and on FPGA

/*Wires*/ 
begin
logic [31:0] PCNext;
logic [31:0] PC;
logic [31:0] PCPlus4;
logic [31:0] PCTarget
logic [31:0] Instr;
logic [31:0] ImmExt;
logic [31:0] SrcA;
logic [31:0] SrcB;
logic [31:0] WriteData;
logic [31:0] ALUResult;
logic [31:0] ReadData;
logic [31:0] Result;
logic Zero;

logic [31:0] RD2;




end

/*Control Unit outputs*/
begin

logic PCSrc;
logic ResultSrc;
logic MemWrite;
logic [3:0] ALUControl;
logic ALUSrc;
logic [1:0] ImmSrc;
logic RegWrite;

end



/* Building Blocks */


ALU ALU( SrcA , SrcB , ALUControl , ALUResult , Zero); 

Reg_File RegisterFile( Instr[19:15] , Instr[24:20] , Instr[11:7] , Result , RegWrite , clk , SrcA , RD2);
















endmodule