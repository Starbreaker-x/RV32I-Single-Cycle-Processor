module RM_tb();

logic [31:0] PCTarget , PCPlus4 , ImmExt , RD , ALUResult , Result;

logic [2:0] ResultSrc;

Result_Mux dut( ALUResult , RD , ImmExt , PCPlus4 , PCTarget, ResultSrc , Result );


task check ( input logic [31:0] Result_expected , input string testname);

    if( Result === Result_expected )
    $display("%s test paased", testname);
    else begin
      $display("%s failed, expected: %h , got: %h", testname , Result_expected , Result );
      $finish;
    end
        


endtask


/*
ResultSrc Encodings

000: ALU Result

001: ReadData

010: PCPlus4

011: ImmExt

100: PCTarget
 */


 initial begin
ALUResult = 32'd1;
RD = 32'd2;
PCPlus4 = 32'd3;
ImmExt = 32'd4;
PCTarget = 32'd5;

ResultSrc = 3'b000;
#5;
check( 32'd1 , "ALUResult");

ResultSrc = 3'b001;
#5;
check( 32'd2 , "ReadData");

ResultSrc = 3'b010;
#5;
check( 32'd3 , "PCPlus4");

ResultSrc = 3'b011;
#5;
check( 32'd4 , "ImmExt");

ResultSrc =3'b100;
#5;
check( 32'd5 , "PCTarget");

$display("All tests passed");
$finish;

 end



endmodule