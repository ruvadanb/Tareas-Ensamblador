.data

.text
	main:
	li $s0, 6 #n
	li $s1, 1 #i
	li $s2, 1 #variable resultado
	li $t2, 1 #constante
	li $t3, 2 #base 2
	addi $s0, $s0, 1
	
	for:
	slt $t0, $s1, $s0 # si i<n t0=1
	beq $t0, $t2, multiplicacion
	j exit
	
	multiplicacion:
	addi $s1, $s1, 1
	mul $s2, $t3, $s2
	j for
	
	exit: