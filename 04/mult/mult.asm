// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Sum R0 , R1 times and store the result in R2
// sum = 0
// for (i = 0; i< R1;i++):
//    sum = sum + R0
// R2 = sum

  @i
  M=0
  @R2
  M=0

(LOOP)
  @i
  D=M //D=i
  @R1
  D=D-M // D = i - R1
  @END
  D;JGE // i-R1 > 0 go to end
  @R0
  D=M //D = R0
  @R2
  M=D+M // Sum =  R0 + Sum
  @i
  M=M+1
  @LOOP
  0;JMP //Go to loop



(END)
  @END
  0;JMP //Infinite loop
