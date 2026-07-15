//Test Cases
/*   input into the register and make sure you read the correct value (for both registers pointed at by A1 & A2)
     Write input into register and see if the register changes values on the rising clock edge
     Read previous value then write and see if the new value read is correct
     Make sure that writing only occurs on the rising edge of a clock, and when Write Enable is high( so 4 seperate cases fo this)
     Make sure that register x0 reads as 32'd0 and cannot be written to always

        
     */

module RF_tb();

logic [4:0] A1, A2, A3;
logic [31:0] WD3;
logic WE3, clk = 0;
logic [31:0] RD1, RD2;


Reg_File dut(A1, A2, A3, WD3 , WE3 , clk , RD1 , RD2);

always #5 clk = ~clk;

initial begin 


//writing into register and reading from RD1
@(negedge clk);
WD3 = 32'b11110000111100001111000011110000; A3 = 5'b00001; A1 = 5'b00001; WE3 = 1;
@(posedge clk);
#1;
assert( RD1 === 32'b11110000111100001111000011110000 ) else $error(" failed test 1 ");

//writing into register and reading from RD2
@(negedge clk);
WD3 = 32'b00001111000011110000111100001111; A3 = 5'b00011; A2 = 5'b00011;
@(posedge clk);
#1;
assert( RD2 === 32'b00001111000011110000111100001111) else $error(" failed test 2 ");

/*Seeing if we try writing into a register but WE3 is low so nothing changes for bot Reading Registers*/

//RD1 check
@(negedge clk);
WD3 = 32'b00000000000000000000000000000001; A3 = 5'b00001; A1 = 5'b00001; WE3 = 0;
@(posedge clk);
#1;
assert( RD1 === 32'b11110000111100001111000011110000 ) else $error(" failed test 3 ");


//RD2 check
@(negedge clk);
A3 = 5'b00011; A2 = 5'b00011;
@(posedge clk);
#1
assert( RD2 === 32'b00001111000011110000111100001111 ) else $error(" failed test 4 ");

/*Checking to see if register reads the correct value before and after a new write*/

//RD1

@(negedge clk);
assert( RD1 === 32'b11110000111100001111000011110000 ); A3 = 5'b00001; WE3 = 1;
@(posedge clk);
#1;
assert( RD1 === 32'b00000000000000000000000000000001 ) else  $error(" failed test 5 "); 

//RD2

@(negedge clk);
assert( RD2 ===  32'b00001111000011110000111100001111) else $error(" failed test 6 , got: %b", RD2); A3 = 5'b00011;
@(posedge clk);
#1;
assert( RD2 ===  32'b00000000000000000000000000000001 )else $error(" failed test 7 ");

/* x0 checks, must be read as 0 and will be 0 no matter what is weritten to it*/


//Reading check
@(negedge clk);
A1 = 5'b00000; A2 = 5'b00000;
@(posedge clk);
#1;
assert( (RD1 === 32'd0) && (RD2 === 32'd0) ) else $error(" failed test 8 ");

//Writing check
@(negedge clk);
A3 = 5'b00000;
@(posedge clk);
#1
assert( (RD1 === 32'd0) && (RD2 === 32'd0) ) else $error(" failed test 9 ");




end

endmodule