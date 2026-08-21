module MD_tb();


 logic [6:0] Op;
 logic RegWrite, ALUSrc, MemWrite, Branch;
 logic [2:0] ImmSrc, ResultSrc;
 logic [1:0] ALUOp;
 


 
 Main_Decoder dut(Op, RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, ImmSrc, ALUOp);


 task check( input logic [6:0] Op,
  input logic RegWrite_exp, ALUSrc_exp, MemWrite_exp, input logic [2:0] ResultSrc_exp, input logic Branch_exp, 
  input logic [2:0] ImmSrc_exp, ALUOp_exp, 
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


Op = 7'b0000011; // lw, lh , lb
#5;
check( 7'b0000011 , 1'b1 , 1'b1 , 1'b0 , 1'b1 , 1'b0 , 3'b000 , 2'b00 , "lw" );

Op = 7'b0100011;// S-type
#5;
check( 7'b0100011 , 1'b0 , 1'b1 , 1'b1 , 3'bxxx , 1'b0 , 3'b001 , 2'b00 , "S-type" );

Op = 7'b0110011;//R-type
#5;
check( 7'b0110011 , 1'b1 , 1'b0 , 1'b0 , 3'b000 , 1'b0 , 3'bxxx , 2'b10 , "R-type");

Op = 7'b1100011;//B-type
#5;
check( 7'b1100011 , 1'b0 , 1'b0 , 1'b0 , 3'bxxx , 1'b1 , 3'b010 , 2'b01 , "B-Type");

Op = 7'b00010011;//I-type immediate instructions
#5;
check( 7'b00010011 , 1'b1 , 1'b1, 1'b0 , 3'b000 , 1'b0 , 3'b000 , 2'b10 , "I-type immediate");

//U-type instructions

Op = 7'b0110111; // lui
#5;
check( 7'b0110111 , 1'b1 , 1'b1 , 1'b0 , 3'b011 , 1'b0 , 3'b100 , 2'bxx , "lui" );

Op = 7'b0010111; //auipc
#5;
check( 7'b0110111 , 1'b1 , 1'b1 , 1'b0 , 3'b100 , 1'b0 , 3'b100 , 2'bxx , "auipc" );

// J-type jal and I-type jalr

Op = 7'b1101111; //jal
#5;
check( 7'b1101111 , 1'b1 , 1'b1 , 1'b0 , 3'b010 , 1'b1 , 3'b011 , 2'bxx , "jal" );

Op = 7'b1100111; //jalr
#5;
check( 7'b1100111 , 1'b1 , 1'b1 , 1'b0 , 3'b010 , 1'b1 , 3'b000 , 2'bxx , "jalr");

Op = 7'b1111111;//default test code
#5;
check( 7'b1111111 , 1'bx, 1'bx , 1'bx , 3'bxxx , 1'bx , 3'bxxx , 2'bxx , "default");
$display("All test passed");
$finish;

end



endmodule