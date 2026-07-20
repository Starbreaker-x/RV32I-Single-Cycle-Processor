module DM_tb();

logic [31:0] A, WD, RD;
logic clk = 0,WE;



DM dut(A,WD,clk,WE,RD);


task check(input logic [31:0] expected, string testname);
if (RD === expected)
  $display("At address %h is: %b, %s passed", A, RD, testname);
else
  $display(" %s failed: At address %h is: %b, expected: %b ", testname, A, RD, expected);
endtask


always #5 clk = ~clk;



initial begin

//Read with noting there

@(negedge clk);
A = 32'h0000_0000; WD = 32'hFFC4A303; WE = 0;

@(posedge clk);
check(32'hxxxx_xxxx, "Nothing there test, Address 0");

@(negedge clk);
A = 32'h0000_0004; WD = 32'h0064A423; 

@(posedge clk);
check(32'hxxxx_xxxx, "Nothing there test, Address 4");


//Writing 

@(negedge clk);
A = 32'h0000_0000; WD = 32'hFFC4A303; WE = 1;

@(posedge clk);
#2
check(32'hFFC4A303, "Writing to Addres 0 test");

@(negedge clk);
A = 32'h0000_0004; WD = 32'h0064A423;

@(posedge clk);
#2
check(32'h0064A423, "Writing to addres 4 test");


//Checking to see if the values of RD stay the same if WE is low

@(negedge clk);
WE = 0;

@(posedge clk);
check(32'h0064A423, "Value unchaged test, Address 4");

@(negedge clk);
A = 32'h0000_0000;

@(posedge clk);
check(32'hFFC4A303, "Value unchaged test: Address 0");
$finish;

end



















endmodule