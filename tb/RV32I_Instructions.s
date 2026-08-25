# 4 at reg x1
addi x1, x0, 4;
#15 at reg x2
addi x2, x0, 15;
#8 at  reg x3
addi x3, x0, 8;
#2 at reg x4
addi x4, x0, 2;
# 4,026,531,840 at reg x5
lui x5, 0xF0000;
ori x5, x5 , 0x000;
# 7 at reg x6
addi x6, x0, 7;

#R type instructions

#add
add x7, x1, x2;
#sub
sub x8, x2, x1;
#and
and x9, x2, x6;
#or
or x10, x1, x4;
#xor
xor x11, x2, x6;
#slt
slt x12, x5, x4;
slt x13, x4, x5;
#sltu
sltu x14, x5, x4;
sltu x15, x4, x5;
#SLL
sll x16, x1, x4;
#SRL

#sign extension
srl x17, x5, x4;
#regular
srl x18, x3, x4;

#SRA

#sign extension
sra x19, x5, x4;

#regular
sra x20, x3, x4;

#end of R type instructions

#Immediate instructions



#slti
slti x21, x5, -15;

slti x21, x4, -15;

#sltiu
sltiu x22, x5, 0;

sltiu x22, x4, 7;

#xori
xori x23, x2, 15;

#slli
slli x24, x1, 5;

#srli

#sign extendsion
srli x17, x5, 2;

#regular
srli x18, x3, 2;



#srai

#sign extension
srai x19, x5, 2;

#regular
srai x20 , x3 , 2;


#andi
andi x7, x5, 0xFFF;


#jalr
jalr x8, x0 , 144;


#end of Immediate instructions

srai x19, x5, 2;

srai x19, x5, 2;

srai x19, x5, 2;

#PC will land on the next instruction following jalr

#auipc

auipc x9, 0x001;

#jal

jal x10, 8;

# jal will jump to the instruction after this one
jal x10, 0;

#S-type instructions

lui x11, 0xFFFFF;
ori x11, x11, 0xFFF;

sw x11, 4(x0);

sh x11, 8(x0);

sb x11, 12(x0);




#end of S-type instructions


# Load instructions


#lb

lb x12, 12(x0);

#lh

lh x13, 12(x0);

#lbu

lbu x14, 12(x0);

#lhu

lhu x15, 12(x0);

#lw

lw x16, 12(x0);

#end of Load instructions


# B-type instructions

#next PC = 196

#beq: Not Branching

beq x0, x1 , 0;

#beq: Branching

beq x1, x1, 208;

add x1, x1, x1;

#bne: Not Branching

bne x1, x1, 4;

#bne: Branching

bne x0, x1, 224;

add x1, x1, x1;

add x1, x1, x1;

#blt: Not Branching

blt x0, x5, 32;


#blt: Branching

blt x5, x0 , 232;;

#bge Not Branching

bge x5, x0, 44;

#bge: Branching

bge x0, x5, 240;

#bltu: Not Branching

bltu x5, x0, 50;

#bltu: Brancing

bltu x0, x5, 248;

#bgeu: Not Branching

bgeu x0, x5, 6;

#bgeu: Branching

bgeu x5, x0, 256;



# end of B-type instructions

add x0, x0, x0;
