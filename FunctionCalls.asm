.data
##; Input data
A: .word 5
B: .word 3
##; Output Data
Res: .word 0

.text
##	;Base address registers
#	a_addr		: $t0
#	b_addr		: $t1
#	result_addr	: $t2
##	;Main function registers
#	a		: $s0
#	b		: $s1
#	result		: $s2
#	arg1		: $a0
#	arg2		: $a1
#	v0		: $v0		;return value modified after called functions are returned
##	;Compare function registers
#	slt_compare	: $t3
#	arg1		: 		;defined in main function			
#	arg2		: 		;defined in main function			
#	ra_mem		: $t4		;return address backup
##	;Punish function registers
#	arg1		: 		;defined in main function			
#	arg2		: 		;defined in main function			
#	v0		: 		;modified when punish() is called
##	;Award function registers
#	arg1		: 		;defined in main function			
#	arg2		: 		;defined in main function			
#	v0		: 		;modified when award() is called
#	

##; Main function ##
main:
	la $t0, A				# $t0, A base address			
	la $t1, B				# $t1, B base address			
	la $t2, Res			# $t2, Res base address			
	lw $s0, 0($t0)			# take input a
	lw $s1, 0($t1)			# take input b
	addi $s2, $0, 0			# result=0
	bne $s0, $s1, else_main		# jump else_main if a=b is false
	add $s2, $s0, $s1			# result=a+b
	sll $s2, $s2, 3			# result = 8*result (result=8*(a+b))
	j done_main_if			# jump done_main_if
else_main:
	add $a0, $s0, $0			# arg1=a
	add $a1, $s1, $0			# arg2=b
	jal compare			# call compare(), $ra keeps PC address
	add $s2, $v0, $0			# result = compare(a,b)
done_main_if:
	addi $v0, $s2, 0			# return result (v0 contains result)
	sw $v0, 0($t2)			# store return value in data section
	j end				# call program ending function
##; Main function end ##

##; Compare function ## only arguments are used, return adress is backed up
compare:
	slt $t3, $a0, $a1			# slt_compare=1 if a is less than b
	add $t4, $ra, $0			# store $ra in ra_mem
	beq $t3, 0, else_compare		# jump else_compare if condition is false
	jal punish				# call punish()
	add $ra, $t4, $0			# backup $ra from ra_mem
	j $ra				# return caller function
else_compare:	
	jal award				# call award()
	add $ra, $t4, $0			# backup $ra from ra_mem
	j $ra				# return caller function
##; Compare function end ##

##; Punish function ## only arguments are used, return register modified
punish:	
	sub $v0, $a0, $a1 			# return v0=a-b
	sll $v0, $v0, 1			# return v0=2*v0
	j $ra				# return caller function
##; Punish function end ##

##; Award function ## only arguments are used, return register modified
award:
	add $v0, $a0, $a1 			# return v0=a+b
	sll $v0, $v0, 2			# return v0=4*v0
	j $ra				# return caller function
##; Award function end ##
	
end:
    syscall					# Exit
