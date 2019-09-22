.data


.text
	li $s0, 1 #counter
	li $s1, 0 #variable
	li $s2, 20
	li $t1, 4
	li $t2, 1

	while:
	slt $t0, $s1, $s2 #Pon t0=1 si s1<s2
	beq $t0, $t2, Suma
	j exit
	
		
	Suma:
	add $s0, $s0, $s0
	Division:
	div $s1, $s0, $t1
	j while
	
 	exit: