.data
##; Input data
A: .word 8, 6, 4, 2

.text

##	;Main function registers
#	Base address: $t0
#	A(i)		: $s0
#	A(i+1)		: $s1
#	diff		: $s2
##	;For loop registers
#	slt_res_for	: $t1
#	i		: $t2			
#	i_limit		: $t3
##	;Multiplication loop registers
#	slt_res_mult	: $t4
#	j		: $t5
#	multiplier		: $t6
#	product		: $s3
##	;If registers
#	slt_res_if		: $t7
	
main:
	la $t0, A			# $t0, A base address			
	addi $s2, $0, 0		# $s2, diff = 0
	addi $t2, $0, 0		# $t2, i = 0
	addi $t3, $0, 3		# $t3, i_limit = 3

##; for loop begin##
loop_for:
	slt  $t1, $t2, $t3		# $t1 = 1 if i is less than i_limit=3
	beq  $t1, $0, done_for	# jump done_for if $t1 = 0 (condition is false)
	lw	 $s0, 0($t0)	# $s0, load A(i)
	lw	 $s1, 4($t0)	# $s1, load A(i+1) 
	sub  $s2, $s1, $s0		# A(i+1)-A(i) -> diff
		
##; calculation 5*A[i] begin##
	addi $t5, $0, 0		# j=0	
	addi $t6, $0, 5		# multiplier=5
	addi $s3, $0, 0		# product=0
loop_mult:	
	slt $t4, $t5, $t6		# slt_res_mult=1 if j is less than multiplier=5
	beq $t4, $0, done_mult	# jump done_mult slt_res_mult=0
	add $s3, $s3, $s0		# product=product+A(i)
	addi $t5, $t5, 1		# increment j by 1
	j    loop_mult		# jump loop_mult
done_mult:
##; calculation 5*A(i) end##

##; if/else begin ##
	slt $t7, $0, $s2		# slt_res_if=1 if 0 is less than diff
	beq $t7, $0, else_op	# if diff is less than 0 continue, else jump else_op
if_op:
	sw $s3, 0($t0)		# store product --> A(i)
	j done_if			# jump done_if
else_op:
	sub $s3, $0, $s3		# product = -product
	sw $s3, 4($t0)		# store product --> A(i+1)
done_if:
##; if/else end##

	addi $t0, $t0, 4		# increment array address by 4 (index by 1)
	addi $t2, $t2, 1		# increment i by 1
	j    loop_for		# jump loop_for
done_for:
##; for loop end##

endloop:
    li      $v0, 10			# terminate program run and
    syscall				# Exit
