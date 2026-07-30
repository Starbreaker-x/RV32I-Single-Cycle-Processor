module DM_tb2();

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
check(32'h0000_0004, " 4 test, Address 0");

@(negedge clk);
A = 32'h0000_0004; 

@(posedge clk);
check(32'h0000_000F, " 15 test, Address 4");

@(negedge clk);
A = 32'h0000_0008; 

@(posedge clk);
check(32'h0000_0008, " 8 test, Address 8");

@(negedge clk);
A = 32'h0000_000C; 

@(posedge clk);
check(32'h0000_0002, " 2 test, Address 12");

@(negedge clk);
A = 32'h0000_0010;

@(posedge clk);
check(32'hF000_0000, " 4,026,531,840 test, Address 16");

@(negedge clk);
A = 32'h0000_0014; 

@(posedge clk);
check(32'h0000_0007, " 7 test, Address 20");

$display("All tests pass");
$finish;

end



endmodule