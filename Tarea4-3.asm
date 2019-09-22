.data


.text
	li $s0, 1 #counter
	li $s1, 0 #variable
	li $s2, 20 #constante
	li $t1, 4 #constante
	li $t2, 1 #constante

	while:
	slt $t0, $s1, $s2 #Pon t0=1 si s1<s2
	beq $t0, $t2, Suma #si t0=t2 enoncess brinca a suma
	j exit
	
		
	Suma:
	add $s0, $s0, $s0 #sumamos counter=suma(counter,counter)
	Division:
	div $s1, $s0, $t1 #dividimos variable=counter/4
	j while
	
 	exit: