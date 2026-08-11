module Extend_testbench();

logic [31:0] ImmExt, Instr;
logic [2:0] ImmSrc; 

/*  ImmSrc: 000 , Type I , 12 bit signed immediate
    
    ImmSrc: 001 , Type S , 12 bit signed immediate

    ImmSrc: 010 , Type B , 13 bit signed immediate
    
    ImmSrc: 011 , Type J , 21 bit signed immediate

    ImmSrc: 100 , Type U , 20 bit signed immediate
                                                     */





task check(input [31:0] expected, input string test);

if(ImmExt !== expected) begin
    $error("%s failed: expected: %h , got: %h", test , expected, ImmExt);
    $finish;
    end
else
    $display("%s passed",test);    
endtask

Extend dut(Instr, ImmSrc, ImmExt);

initial begin


// lw: I-Type Instruction
Instr = 32'b111111111100_01001_010_00110_0000011; ImmSrc = 3'b000;
#10
check(32'hFFFFFFFC,"I-Type test, lw instruction");

// sw: S-Type Instruction 
Instr = 32'b0000000_00110_01001_010_01000_0100011; ImmSrc = 3'b001;
#10
check(32'b0000_0000_0000_0000_0000_0000000_01000, "S-Type test, sw instruction");

// beq: B-Type Instruction
Instr = 32'b1111111_00100_00100_000_10101_1100011; ImmSrc = 3'b010;
#10
check(32'b1111_1111_1111_1111_1111_1_111111_1010_0, "B-Type test, beq instruction");

/*for the J & U tests Instr isn't an acutal instruction
 just going to be testing that the bit slicing is
 placing the correct values */

// J-type 
 Instr = 32'h89AB_CDEF; ImmSrc = 3'b011;
 #10
 check(32'hFFFB_C09A, "J-Type test");

 ImmSrc = 3'b100;
 #10
 check(32'h89AB_C000, "U-Type test");

$display("All tests passed");
$finish;
end


endmodule

