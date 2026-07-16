module Extend_testbench();

logic [31:0] ImmExt, Instr;
logic [1:0] ImmSrc; 

/*  ImmSrc: 00 , Type I , 12 bit signed immediate
    
    ImmSrc: 01 , Type S , 12 bit signed immediate

    ImmSrc: 10 , Type B , 13 bit signed immediate */





task check(input [31:0] expected, input string test);

if(ImmExt != expected)
    $error("%s failed: expected: %b , got: %n", expected, ImmExt);
else
    $display("%s passed",test);    

endtask

Extend dut(Instr, ImmSrc, ImmExt);

initial begin

/* Going to use simple tests cases from figure 7.2 of Digital Design and Computer Architechture RISC-Edition*/

// lw: I-Type Instruction
Instr = 32'b111111111100_01001_010_00110_0000011; ImmSrc = 2'b00;
#10
check(32'hFFFFFFFC,"I-Type test, lw instruction");

// sw: S-Type Instruction 
Instr = 32'b0000000_00110_01001_010_01000_0100011; ImmSrc = 2'b01;
#10
check(32'b0000_0000_0000_0000_0000_0000000_01000, "S-Type test, sw instruction");

// beq: B-Type Instruction
Instr = 32'b1111111_00100_00100_000_10101_1100011; ImmSrc = 2'b10;
#10
check(32'b1111_1111_1111_1111_1111_1_111111_1010_0, "B-Type test, beq instruction");


/* All the tests for now until I add the J and U type instructions to the Extend module  */
                       

$display("All tests passed");

end


endmodule
