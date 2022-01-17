# MIPS-Coursework
In this project, you will learn how to write and simulate MIPS code.

Download QtSpim from http://spimsimulator.sourceforge.net/ and install it to your computer.

There are several tutorials for QtSpim:

https://www.youtube.com/watch?v=r8WcV7AiLXs   
https://www.lri.fr/~de/QtSpim-Tutorial.pdf  
http://logos.cs.uic.edu/366/notes/MIPS%20Quick%20Tutorial.htm

Short explanation how to write and simulate your code:
1) You should use a text editor such as notepad or wordpad and write your MIPS program
first.
2) Save your program with an extension .asm.
3) Open QtSpim
4) Load your program by selecting from the menu.
5) Run your program.
6) Your results will be either in registers or in memory based on your program output.

In this project, you will write and simulate two different programs. You should write commands
to explain the purpose of the instruction in your program.

# 1) Arrays using for loops

Write a MIPS code for the following C code fragment. In your code, you are not allowed to use multiplication instructions (mult or mul).

![resim](https://user-images.githubusercontent.com/73522423/149719286-5e8f4615-7a80-46c8-afda-8804885d985b.png)

Your array size will be 4. Test your code for the test cases given below.

Test 1: A={2,4,6,8}  
Test 2: A={8,6,4,2}  
Test 3: A={2,2,6,4}  

For each test, save the screenshot of the memory before running the code and screenshot of the registers after running the code. 

You can define your array in your code as follows:

![resim](https://user-images.githubusercontent.com/73522423/149719326-bffd868e-1ea1-4314-a545-6ef0c8b94ea2.png)

After la instruction, the address of the first element of array A will be stored in register t1. Then, you can write your code afterwards. You can also define array size in data segment as well.


# 2) Function calls

Write a MIPS code for the following C code fragment. In your code, you are allowed to use multiplication instructions (mult or mul).

![resim](https://user-images.githubusercontent.com/73522423/149719493-995689bb-8ec3-465f-81b8-1fab7b35686e.png)

Test your programs for the following input values:  

Test 1: a=3, b=3  
Test 2: a=3, b=5  
Test 3: a=5, b=3  

For each test, save the screenshot of the registers before running the code and screenshot of the registers after running the code. You should clearly show how you use stack in your code.

