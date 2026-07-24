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

  if(RegWrite !== RegWrite_exp)
  $display(" RegWrite is: %b, expected: %b", RegWrite, RegWrite_exp); $finish;

   if(ALUSrc !== ALUSrc_exp)
  $display(" ALUSrc is: %b, expected: %b", ALUSrc, ALUSrc_exp); $finish;

   if(MemWrite !== MemWrite_exp)
  $display(" MemWrite is: %b, expected: %b", MemWrite, MemWrite_exp); $finish;

   if(ResultSrc !== ResultSrc_exp)
  $display(" ResultSrc is: %b, expected: %b", ResultSrc, ResultSrc_exp); $finish;

   if(Branch !== Branch_exp)
  $display(" Branch is: %b, expected: %b", Branch, Branch_exp); $finish;

   if(ImmSrc !== ImmSrc_exp)
  $display(" ImmSrc is: %b, expected: %b", ImmSrc, ImmSrc_exp); $finish;

   if(ALUOp !== ALUOp_exp)
  $display(" ALUOp is: %b, expected: %b", ALUOp, ALUOp_exp); $finish;

  $display(" All outputs for Op Code: %b are valid, %s test passes", Op, testname);



endtask

































endmodule