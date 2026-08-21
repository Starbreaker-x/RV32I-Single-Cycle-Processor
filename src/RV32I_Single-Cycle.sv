module RV32I_SC( input logic clk, reset, output logic [31:0] PC);

//PC is an output for testing purpouses in simulation and on FPGA

/*Wires*/ 

logic [31:0] PCNext;
logic [31:0] PCPlus4;
logic [31:0] PCTarget;
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

logic [31:0] PCT_Mux_output;






/*Control Unit outputs*/

logic PCSrc;
logic [2:0] ResultSrc;
logic MemWrite;
logic [3:0] ALUControl;
logic ALUSrc;
logic [2:0] ImmSrc;
logic RegWrite;
logic PCTSrc;


assign WriteData = RD2;


/* Building Blocks */


ALU ArithmeticLogicUnit( SrcA , SrcB , ALUControl , ALUResult , Zero ); 

Reg_File RegisterFile( Instr[19:15] , Instr[24:20] , Instr[11:7] , Result , RegWrite , clk , Instr[6:0] , funct3 , SrcA , RD2 );

SrcB_Mux SrcB_Multiplexer( RD2 , ImmExt , ALUSrc , SrcB );

DM DataMemory( ALUResult , WriteData , clk , MemWrite , Instr[6:0] , funct3 , ReadData );

Result_Mux Result_Multiplexer( ALUResult , ReadData , ImmExt, PCPlus4 , PCTarget , ResultSrc , Result );

IM InstructionMemory( PC , Instr );

PC ProgramCounter( PCNext , clk , reset , PC );

PC_Mux PC_Multiplexer( PCPlus4 , PCTarget , PCSrc , PCNext );

PCPlus4 PCPlus4_Adder( PC , PCPlus4 );

PCTarget PCTarget_Adder( PCT_Mux_output , ImmExt , PCTarget );

Extend ExtendUnit( Instr , ImmSrc , ImmExt );

CU ControlUnit( ALUResult , Instr[6:0] , Instr[14:12] , Instr[30] , Zero , PCSrc , ALUSrc , ResultSrc , MemWrite , RegWrite , ImmSrc  , ALUControl );

PCT_Mux PCTarger_Multiplexer( Instr[19:15] , PC , PCTSrc , PCT_Mux_output );

endmodule