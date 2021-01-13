# Translate the following:

	#read integers num and size
	#for(int i = 0; i < num; i++) {
		#int len = i * size;
		#for(int j = 0; j < size; j++) {
			#for(int k = 0; k < len; k++)
				#System.out.print(" "); //space is character 32
			#for(int k = 0; k < size; k++)
				#System.out.print("."); //period is character 46
			#System.out.println(); //newline is character 10
		#}
	#}
	
# Read int -> for(i)-> for(j)-> for(k,len) -> for(k,size)
	
# Code:

	#Read int num
	addi	$v0, $zero, 5
	syscall
	
	# t0 is num 
	add	$t0, $zero, $v0 
	
	#Read int size
	addi	$v0, $zero, 5
	syscall
	
	# t1 is size 
	add	$t1, $zero, $v0 
	
	# t2 is i
	addi	$t2, $zero, 0 
	
	b	i_loop
	
inc_i:
	add	$t2, $t2, 1
	
i_loop:

	# t3 is j
	addi	$t3, $zero, 0
	
	bge	$t2, $t0, DONE
	
	# t5 is len
	addi	$t5, $zero, 0
	mulo	$t5, $t2, $t1 
	b	j_loop

inc_j:
	add	$t3, $t3, 1
	
j_loop:
	
	# t4 is k
	addi	$t4, $zero, 0 
	bge	$t3, $t1, inc_i
	
	# print newline
	addi	$v0, $zero, 11
	addi	$a0, $zero, 10
	syscall

k_len_loop:
	
	bge	$t4, $t5, reset
	
	# print space
	addi	$v0, $zero, 11
	addi	$a0, $zero, 32
	syscall
	
	# add 1 to k ($t4)
	addi	$t4, $t4, 1
	b	k_len_loop

reset:	

	addi	$t4, $zero, 0				
						
k_size_loop:

	bge	$t4, $t1, inc_j
	
	# print period
	addi	$v0, $zero, 11
	addi	$a0, $zero, 46
	syscall
	
	# add 1 to k ($t4)
	addi	$t4, $t4, 1
	b	k_size_loop
	
DONE:		
	
	#Exit code
	addi	$v0, $zero, 10
	syscall
	
	
	
	
