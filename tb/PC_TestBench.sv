/* Time to create the testbench for the Program Counter(PC), I've never made a testbench on modules 
that are technically made up of other modules, so lets see how I do*/

module PC_tb();

// I/O for the PC
logic [31:0] PCNext, PC; logic clk = 0;

//I/O for the Plus4 Adder
logic [31:0] PCPlus4;


//I/O for the Target Adder
logic [31:0] ImmExt, PCTarget;

//I/O for the Mux
logic PCSrc;


//initializing modules
PCPlus4 PC4(PC, PCPlus4);
PCTarget PCT(PC, ImmExt, PCTarget);
PC_Mux PCM(PCPlus4, PCTarget, PCSrc, PCNext);

//Dut
PC dut(PCNext, clk, PC);


task check(input [31:0] expected_PC, expected_PCNext, input  string testname);

        if( PC == expected_PC && PCNext == expected_PCNext )
            $display("%s passed, PC is: %h, PCNext is: %h ", testname, PC, PCNext);
        else
            $display("%s failed, PC is: %h, expected: %h, PCNext is %h, expected: %h", testname, PC, expected_PC, PCNext, expected_PCNext);
    
endtask


always #5 clk= ~clk; // initiating clk


initial begin


@(negedge clk);
PC = 32'h1000; PCSrc = 0; ImmExt = 32'h0000_0001;
#2
check(32'h1000, 32'h1004, " Initial test ");//To see if we get the currect result after initalizing

@(posedge clk);
#2
check(32'h1004, 32'h1008, " PCPlus4 test ");// To see if we use the PCPlus4 adder when PC_Mux is  low

@(posedge clk);
#2
check(32'h1008, 32'h100C, " PCPlus4 test 2");

@(negedge clk);
PCSrc = 1;

@(posedge clk);
#2
check(32'h100, 32'h100D, "PCTarget test");// To see if we use the PCTarget adder when PC_mux is high

@(negedge clk);
PCSrc = 0;

@(posedge clk);
#2
check(32'h100D, 32'h1011, " Mux switching test ");// To see if the mux can switch back between both operations correctlhy
$finish;
end

endmodule