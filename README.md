# RISC-V 32 bit instruction (RV32I) processor
Implemented in SystemVerilog, simulated and verified in Vivado




## Implemented Features

### Suported Instructions
- lw
- sw
- beq
- All R-Type Instructions ( add , sub , and , or , xor , slt , sltu , sll , srl , sra )


### Architecture
- **ALU**: Supports all 10 R-Type Instructions
- **Register File**: Contains 32 32-bit registers with x0 being hardwired to 0
- **Extend Unit**: Currently supports 12-bit I and S type and 13-bit B type signed immediates 
- **Data / Instruction Memory**: Can store 256, 32 bit values, byte addressed using little endianness
- **PC**: Clock driven, contains a reset input, subsequent address determined by Plus4 and Target Adders
- **Control Unit**: Made up of the Main and ALU Decoders, outputs all the control signals

### Verification
- Functionality verified via testbenches for individual modules as well as a testbench for the top module
- Further verified via the waveform viewer by running behavioral simulations in Vivado

**Schematic of the top module**
<img width="777" height="272" alt="Screenshot 2026-08-03 180355" src="https://github.com/user-attachments/assets/eddc5ade-e61e-463a-96e3-fd58839b30db" />

## Tools
- Implemented in SystemVerilog
- Used Vivado to run behavioral simulations
- Verified encoded instructions machine code by using a RISC-V assembler before loading hex file contents to instruction memory
- I plan on using the Diligent Arty A7 100-T FPGA for further testing

## How to run
- Contains all RTL modules
- Contains all testbenches and hex files to initialize modules such as Data & Instruction Memory
- To run in Vivado set RV32I_Single-Cycle.sv and TopModule_TestBench.sv as top for design and simulation sources respectively and run a behavioral simulation


**Loading registers x1-->x6 with values from Data Memory**
<img width="944" height="245" alt="image" src="https://github.com/user-attachments/assets/8794c6fb-8892-4483-85f3-61e4d5342ae8" />

**add , sub , and , or , & xor instructions**
<img width="830" height="250" alt="image" src="https://github.com/user-attachments/assets/13f9e94b-a154-4c0b-87d5-8cb6b1d42c6f" />

**slt & sltu instructions**
<img width="677" height="248" alt="image" src="https://github.com/user-attachments/assets/8399555d-cfb1-4851-8fe6-c8b9cc962e98" />

**Shifting instructions**
<img width="776" height="251" alt="image" src="https://github.com/user-attachments/assets/820adf3a-7198-49ff-bd4f-d179ed1dfddf" />

**sw and beq instructions**
<img width="417" height="240" alt="image" src="https://github.com/user-attachments/assets/11d2bbbf-72af-47d5-8e32-a63ff66983f7" />


## Limitations
- Currently I-Type Immediate instructions, U & J Type, as well as additional branch instructions are not yet implemented
- When the I-Type immediate instructions are implemented it will eliminate the need to initialize Data Memory


## Motivation & Goals
I started this project because I became interested in Digital Design and wanted to build my own processors.
I've been following along with Digital Design and Computer Architecture RISC-V Edition by David and Sarah Harris to improve my understanding of digital design.

Overall building this project was a fun experience, this was my first time using SystemVerilog or any other HDL so it was nice to see the differences between a programming language.
I believe I’ve learned a lot from this and hope that this experience allows me to build more fun and complex processors in the future





