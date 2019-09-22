.data
	li $s0, 0 #selector
	li $s1, 5 #constante a
	li $s2, 3 #constante b
	li $s3, 0 #constante

.text

	main:
	li $t0, 1
	li $t1, 2
	li $t2, 3
	beq $s0, $t0, suma
	beq $s0, $t1, resta
	beq $s0, $t3, multiplicacion
	j Andbitwise
	
	suma:
	add $s3, $s1, $s2
	j Exit
	
	resta:
	sub $s3, $s1, $s2
	j Exit
	
	multiplicacion:
	mul $s3, $s1, $s2
	j Exit
	
	Andbitwise:
	and $s3, $s1, $s2
	j Exit
	
	Exit:
	