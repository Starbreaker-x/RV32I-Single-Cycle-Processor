module MD_tb();


 logic [6:0] Op;
 logic RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
 logic [1:0] ImmSrc, ALUOp;


 
 Main_Decoder dut(Op, RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, ImmSrc, ALUOp);


 task check( input logic [6:0] Op,
  input logic RegWrite_exp, ALUSrc_exp, MemWrite_exp, ResultSrc_exp, Branch_exp, 
  input logic [1:0] ImmSrc_exp, ALUOp_exp, 
  input string testname);

  $display("Op Code: %b, %s test", Op, testname );

  if(RegWrite !== RegWrite_exp) begin
  $display(" RegWrite is: %b, expected: %b", RegWrite, RegWrite_exp); 
  $finish;
  end

   if(ALUSrc !== ALUSrc_exp) begin
  $display(" ALUSrc is: %b, expected: %b", ALUSrc, ALUSrc_exp);
  $finish;
  end

   if(MemWrite !== MemWrite_exp) begin
  $display(" MemWrite is: %b, expected: %b", MemWrite, MemWrite_exp); 
  $finish;
  end

   if(ResultSrc !== ResultSrc_exp) begin
  $display(" ResultSrc is: %b, expected: %b", ResultSrc, ResultSrc_exp); 
  $finish;
  end

   if(Branch !== Branch_exp) begin
  $display(" Branch is: %b, expected: %b", Branch, Branch_exp); 
  $finish;
  end

   if(ImmSrc !== ImmSrc_exp) begin
  $display(" ImmSrc is: %b, expected: %b", ImmSrc, ImmSrc_exp); 
  $finish;
  end

   if(ALUOp !== ALUOp_exp) begin
  $display(" ALUOp is: %b, expected: %b", ALUOp, ALUOp_exp); 
  $finish;
  end

  $display(" All outputs for Op Code: %b are valid, %s test passes", Op, testname);



endtask

initial begin


Op = 7'b0000011; //lw
#5;
check( 7'b0000011 , 1'b1 , 1'b1 , 1'b0 , 1'b1 , 1'b0 , 2'b00 , 2'b00 , "lw" );

Op = 7'b0100011;//sw
#5;
check( 7'b0100011 , 1'b0 , 1'b1 , 1'b1 , 1'bx , 1'b0 , 2'b01 , 2'b00 , "sw" );

Op = 7'b0110011;//R-type
#5;
check( 7'b0110011 , 1'b1 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 2'bxx , 2'b10 , "R-type");

Op = 7'b1100011;//beq
#5;
check( 7'b1100011 , 1'b0 , 1'b0 , 1'b0 , 1'bx , 1'b1 , 2'b10 , 2'b01 , "beq");

Op = 7'b1111111;//default test code
#5;
check( 7'b1111111 , 1'bx, 1'bx , 1'bx , 1'bx , 1'bx , 2'bxx , 2'bxx , "default");
$display("All test passed");
$finish;

end



endmodule