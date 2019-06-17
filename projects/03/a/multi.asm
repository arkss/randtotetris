// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// RAM[R2] = 0;
// RAM[i] = 1;
// while(RAM[i] - RAM[R1] <= 0)
// {
//    RAM[R2] = RAM[R2] + RAM[R0];
//    RAM[i] += 1
// }

	@i
	M=1
	@R2
	M=0
(LOOP)
	@i
	D=M 	// D <- RAM[i]
	@R1
	D=D-M 	// D <- RAM[i]-RAM[R1]
	@END
	D;JGT	// exit loop if (RAM[i]-RAM[R1] > 0) 

	@R0
	D=M		// D <- RAM[R0]
	@R2
	M=D+M	// RAM[R2] <- RAM[R0] + RAM[R2]

	@i
	M=M+1	// RAM[i] <- RAM[i] + 1
	@LOOP
	0;JMP // Goto LOOP
(END)
	@END
	0;JMP // Infinite loop
