`timescale 1ns/1ps
module tb_ALU();

logic  Z;
logic [31:0] A, B, Result;
logic [3:0] Contr;



//Input A, Input B, Contr(the op code), Result)
    ALU dut( A , B , Contr , Result, Z );

    initial begin
    
    //ADD Should probably do proper testing for when an operation exceeds bit container
    A = 32'b0001; B = 32'b0001; Contr = 4'b0000; #20;
    assert(Result === 32'b0010) ;
    $display("Result = %b",Result);
    
    //SUB
    Contr = 4'b0001; #20;
    assert(Result === 32'b0000) ;
    $display("Result = %b",Result);
    
    //AND
    A=32'b1010; B=32'b1111; Contr = 4'b0010; #20;
    assert(Result === 32'b1010) ;
    $display("Result = %b",Result);
    
    //OR
    Contr = 4'b0011; #20;
    assert(Result === 32'b1111) ;
    $display("Result = %b",Result);
    
    //XOR
    Contr = 4'b0100; #20;
    assert(Result === 32'b0101) ;
    $display("Result = %b",Result);
    
    //SLT A<B
    Contr = 4'b0101; A = -32'sd8; B = 32'b0001; #20;
    assert(Result === 32'b0001) ;
    $display("Result = %b",Result);
    
    //SLT A>B
    A = -32'sd8; B= -32'sd10; #20;
    assert(Result === 32'b0000) ;
    $display("Result = %b",Result);
    
    //SLTU A<B
    Contr = 4'b0110; A = 32'b11111111111111111111111111111110; B = 32'b11111111111111111111111111111111; #20;
    assert(Result === 32'b0001) ;
    $display("Result = %b",Result);
    
    //SLTU A == B
    A = 32'b11111111111111111111111111111111; B = 32'b11111111111111111111111111111111; #20;
    assert(Result === 32'b0000) ;
    $display("Result = %b",Result);
    
    //SLL
    Contr = 4'b0111; A = 32'b0001; B = 32'b0011; #20;
    assert(Result === 32'b1000) ;
    $display("Result = %b, 0001 shifted over left by 0011 is 1000",Result);
  
    //SRL
    Contr = 4'b1000; A = 32'b1000; B = 32'b0011; #20;
    assert(Result === 32'b0001)  ;
    $display("Result = %b, 1000 shifted over logicaly right by 0011 is 0001",Result);
    
    //SRA
    Contr = 4'b1001; A = 32'b11000000000000000000000000000000; B = 32'b0010; #20;
    assert(Result === 32'b11110000000000000000000000000000);
    $display("Result = %b, 11000000000000000000000000000000 shifted over arithmeticaly right by 0010 is 11110000000000000000000000000000",Result);
    
    //Zero flag
    
    //Z = 1
    Contr = 4'b0001; A = 32'b001; B = 32'b001; #20;
    assert(Z === 32'd1);
    //Z = 0
    B = 32'b000; #20;
    assert(Z === 32'd0);

    $finish;
    end
    
endmodule