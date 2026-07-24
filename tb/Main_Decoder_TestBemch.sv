module MD_tb();


 logic [6:0] Op,
 logic RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
 logic [1:0] ImmSrc, ALUOp;


 
 Main_Decoder dut(Op, RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, ImmSrc, ALUOp);


 task check( input logic [6:0] Op,
  input logic RegWrite_exp, ALUSrc_exp, MemWrite_exp, ResultSrc_exp, Branch_exp, 
  input logic [1:0] ImmSrc_exp, ALUOp_exp, 
  string testname)

  $display("Op Code: %b, %s test", Op, testname );

  /* Planning on adding if and else statments to check
   each output also have $finish on a failed assertion to end the simulation early */























  



endtask

































endmodule