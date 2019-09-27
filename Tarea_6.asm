.data

.text

	li $s0, 5 #s0 Sera N
	li $s1, 0 # nuestro i
	jal fibonacci
	j exit #salimos del programa
	
	fibonacci:
	slti $t0, $s0, 2
	beq $t0, $zero, loop #nos vamos a loop en caso de n>=2
	addi $v0, $zero, 1 #cargamos 1 en caso de n=0 o n=1
	jr $ra
	
	loop:
	addi $sp, $sp, -8 #reservamos espacio en el stack
	subi $t1, $s0, 1 #guardamos n-1
	subi $t2, $s0, 2 #guardamos n-2 
	add $t1, $t1, $t2 #sumamos (n-1)+(n-2)
	sw $ra, 4($sp) #guardamos la direccion de regreso
	sw $t1, 0($sp) #guardamos 
	addi $s0, $zero, -1 #decrementamos n
	jal
	
	
	exit:
	
