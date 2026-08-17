//Test Cases
/*   input into the register and make sure you read the correct value (for both registers pointed at by A1 & A2)
     Write input into register and see if the register changes values on the rising clock edge
     Read previous value then write and see if the new value read is correct
     Make sure that writing only occurs on the rising edge of a clock, and when Write Enable is high( so 4 seperate cases for this)
     Make sure that register x0 reads as 32'd0 and cannot be written to always

        
     */

module RF_tb();

logic [4:0] A1, A2, A3;
logic [31:0] WD3;
logic WE3, clk = 0;
logic [6:0] Op;
logic [2:0] funct3;
logic [31:0] RD1, RD2;


Reg_File dut(A1, A2, A3, WD3 , WE3 , clk , Op , funct3 , RD1 , RD2);

always #5 clk = ~clk;

task task1(input logic [31:0] RD1_expected, input string testname);

       if( RD1 === RD1_expected)
       $display("%s passed", testname);
       else begin
          $display("%s failed, expected: %b , recieved: %b ", testname, RD1_expected , RD1);
          $finish;
       end
     endtask

task task2(input logic [31:0] RD2_expected, input string testname);

       if( RD2 === RD2_expected)
       $display("%s passed", testname);
       else begin
          $display("%s failed, expected: %b , recieved: %b ", testname, RD2_expected , RD2);
          $finish;
       end
     endtask


initial begin 


//writing into register and reading from RD1
@(negedge clk);
WD3 = 32'b11110000111100001111000011110000; A3 = 5'b00001; A1 = 5'b00001; WE3 = 1;
@(posedge clk);
#1;
task1( 32'b11110000111100001111000011110000 , "test 1");

//writing into register and reading from RD2
@(negedge clk);
WD3 = 32'b00001111000011110000111100001111; A3 = 5'b00011; A2 = 5'b00011;
@(posedge clk);
#1;
task2( 32'b00001111000011110000111100001111 , "test 2");

/*Seeing if we try writing into a register but WE3 is low so nothing changes for both Reading Registers*/

//RD1 check
@(negedge clk);
WD3 = 32'b00000000000000000000000000000001; A3 = 5'b00001; A1 = 5'b00001; WE3 = 0;
@(posedge clk);
#1;
task1( 32'b11110000111100001111000011110000 , "test 3");


//RD2 check
@(negedge clk);
A3 = 5'b00011; A2 = 5'b00011;
@(posedge clk);
#1
task2( 32'b00001111000011110000111100001111 , "test 4" );

/*Checking to see if register reads the correct value before and after a new write*/

//RD1

@(negedge clk);
assert( RD1 === 32'b11110000111100001111000011110000 ); A3 = 5'b00001; WE3 = 1;
@(posedge clk);
#1;
task1( 32'b00000000000000000000000000000001 , "test 5");
//RD2

@(negedge clk);
task2( 32'b00001111000011110000111100001111 , "test 6");
A3 = 5'b00011;
@(posedge clk);
#1;
task2( 32'b00000000000000000000000000000001 , "test 7");

// Load instruction tests

@(negedge clk);
A3 = 5'b00100; A1 = 5'b00100; Op = 7'd3; funct3 = 3'b010; WD3 = 32'b10101010101010101010101010101010;//lw
@(posedge clk);
#2;
task1( 32'b10101010101010101010101010101010 , "lw test" );

@(negedge clk);
funct3 = 3'b000; //lb
@(posedge clk);
#2;
task1( 32'hFFFF_FFAA , "lb test");

@(negedge clk);
funct3 = 3'b001; //lh
@(posedge clk);
#2;
task1( 32'hFFFF_AAAA , "lh test");

@(negedge clk);
funct3 = 3'b100; //lbu
@(posedge clk);
#2;
task1( 32'h0000_00AA , "lbu test");

@(negedge clk);
funct3 = 3'b101; //lhu
@(posedge clk);
#2;
task1( 32'h0000_AAAA , "lhu test");




/* x0 checks, must be read as 0 and will be 0 no matter what is weritten to it*/


//Reading check
@(negedge clk);
A1 = 5'b00000; A2 = 5'b00000; Op = 7'b0000000;
@(posedge clk);
#1;
assert( (RD1 === 32'd0) && (RD2 === 32'd0) ) else $error(" failed test 8 ");
$display("Read x0 test passed");

//Writing check
@(negedge clk);
A3 = 5'b00000;
@(posedge clk);
#1
assert( (RD1 === 32'd0) && (RD2 === 32'd0) ) else $error(" failed test 9 ");
$display("Writing to x0 test passed");
$display("All tests passed");
$finish;


end

endmodule