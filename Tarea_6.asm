.data

.text

	li $a0, 5 #s0 Sera N
	addi $a0, $a0, -1
	jal fibonacci
	add $s0, $zero, $v0
	j exit #salimos del programa
	
	fibonacci:
	slti $t0, $a0, 2
	beq $t0, $zero, general #nos vamos a loop en caso de n>=2
	add $v0, $zero, $s0
	j endif
	
	general:
	addi $sp, $sp, -12 #reservamos espacio en el stack
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $t1, 8($sp)
	
	add $s0, $zero, $a0 
	addi $a0, $s0, -1 #n-1
	jal fibonacci
	add $t1, $zero, $v0
	
	addi $a0, $s0, -2 #n-2
	jal fibonacci
	add $v0, $t1, $v0

	
	endif:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $t1, 8($sp)
	addi $sp, $sp, 12
	jr $ra

	exit:
	
