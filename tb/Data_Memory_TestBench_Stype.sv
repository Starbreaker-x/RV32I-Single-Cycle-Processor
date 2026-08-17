module DM_tbS();

logic [31:0] A, WD, RD;
logic clk = 0,WE;
logic [6:0] Op;
logic [2:0] funct3;


DM dut(A,WD,clk,WE,Op,funct3,RD);


task check(input logic [31:0] expected, input string testname);
if (RD === expected)
  $display("At address %h is: %h, %s passed", A, RD, testname);
else
  $display(" %s failed: At address %h is: %h, expected: %h ", testname, A, RD, expected);
endtask


always #5 clk = ~clk;



initial begin

//Read with noting there

@(negedge clk);
A = 32'h0000_001E; WD = 32'h89AB_CDEF; WE = 0;

@(posedge clk);
check(32'hxxxx_xxxx, "Nothing there test, Address 30");

@(negedge clk);
A = 32'h0000_0022; 

@(posedge clk);
check(32'hxxxx_xxxx, "Nothing there test, Address 34");

@(negedge clk);
A = 32'h0000_0026; 

@(posedge clk);
check(32'hxxxx_xxxx, "Nothing there test, Address 38");


//Writing 

@(negedge clk);
A = 32'h0000_001E; WE = 1; Op = 7'd35; funct3 = 3'b010;

@(posedge clk);
#2
check(32'h89AB_CDEF, "Writing to Address 30, sw test");

@(negedge clk);
A = 32'h0000_0022; funct3 = 3'b001;

@(posedge clk);
#2
check(32'hxxxx_CDEF, "Writing to address 34, sh test");

@(negedge clk);
A = 32'h0000_0026; funct3 = 3'b000;

@(posedge clk);
#2;
check(32'hxxxx_xxEF, "Writing to address 38, sb test");

$display("All test passed");
$finish;


end

endmodule