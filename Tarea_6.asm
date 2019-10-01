.data

.text
	
	main:
	li $a0, 2 #s0 Sera N
	add $t2, $zero, $a0
	addi $a0, $a0, -1
	li $t4, 1
	jal fibonacci
	add $s0, $zero, $v0
	j exit #salimos del programa
	
	fibonacci:
	slti $t3, $t2, 2
	beq $t3, $t4, casobase
	slti $t0, $a0, 2
	beq $t0, $zero, general #nos vamos a loop en caso de n>=2
	add $v0, $zero, $s0
	j endif
	
	casobase:
	addi $a0, $a0, 1
	add $v0, $v0, $a0
	jr $ra
	
	general:
	addi $sp, $sp, -12 #reservamos espacio en el stack
	sw $ra, 0($sp) #guardamos el valor de ra en la primer posicion
	sw $s0, 4($sp) #guardamos el valor de s0 en la segunda posicion
	sw $t1, 8($sp) #guardamos el valor de t1 en la tercer posicion
	
	add $s0, $zero, $a0 #Pasamos vallor de n a s0
	addi $a0, $s0, -1 #decremendamos a N -1
	jal fibonacci #Llamamos funcion fibonacci
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
	
