module IM_tb();

logic [31:0] A, RD;

IM dut(A , RD);


task check( input logic [31:0] expected, input string testname);

if(RD == expected)
    $display("At address %h is: %b, %s passed", A, RD, testname);
else
$display(" %s failed: At address %h is: %b, expected: %b ", testname, A, RD, expected);
endtask





initial begin

A = 32'h0000_0000;
#1
check(32'hFFC4A303, "lw test");

A = 32'h0000_0100;
#1
check(32'h0064A423, "sw test");





end


endmodule