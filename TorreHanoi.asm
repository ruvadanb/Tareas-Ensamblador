.data
	Beg: .word 0 0 0 0 0 0 0 0  # Guardamos los espacios necesarios
	Aux: .word 0 0 0 0 0 0 0 0  #Guardamos los espacios necesarios
	End: .word 0 0 0 0 0 0 0 0  #Guardamos los espacios necesarios
.text
	Main:
	li $s0, 2 # Esta Es nuestra n
	la $t0, Beg #Asignamos la direccion de Torre A a t0
	la $t1, Aux #Asignamos la direccion de Torre B a t1
	la $t2, End #Asignamos la direccion de Torre C a t2
	add $s1, $zero, $s0 #Hacemos copia de n
	li $s2, 0 # i
	li $t3, 0 # registro temporal
	li $v0, 4 #constante para resevar memoria en el apuntador
	mul $v0, $v0, $s0 # para saber cual es el numero en bytes a reservar
	
	#Aqui es donde acomodamos por primera vez los valores en la torre 1
	MainSort:
	sll $t3, $s2, 2 #para iterar en el arreglo
	add $t3, $t3, $t0 #le sumamos el recorrimiento
	sw $s1, 0($t3) # guardamos la copia de n
	addi $s1, $s1 -1 # hacemos n-1
	addi $s2, $s2, 1 # i+1
	bne $s1, $zero, MainSort #checamos si ya terminamos de colocar los valores inciales
	add $s1, $zero, $s0 #regresemaos a s1 el valor de n
	#Cuando Pasa de Aqui es porque ya se pusieron los valores iniciales
	#s2 y t3 son reutilizables
	#add $t3, $zero, $t0 #hacemos un apuntador para el tope de la torre
	#add $t3, $t3, $v0 #hacemos que el apuntador apunte al tope de la torre
	add $t0, $t0, $v0 #hacemos que t0 apunte al tope de la torre(apunta al vacio)
	jal Hanoi
	j Exit
	
	BCase:
	addi $t0, $t0, -4 #recorremos a t0 para que apunte al valor y no al tope vacio
	sw $zero, 0($t0) #ponemos en cero el valor tope de la torre 1
	sw $s1, 0($t2) #ponemos en 1 el valor tope de la torre 3
	addi $t2, $t2, 4 #recorremos el valor del apuntador uno arriba
	jr $ra
	
	Hanoi:
	#checamos si sera caso base
	beq $s1, 1 , BCase #checamos si n es 1, para caso base
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s1, 4($sp) 
	#si no es caso base
	
	#para el primer paso
	addi $s1, $s1, -1 #decrementamos el valor de n(copia)
	#reservamos memoria para el stack
	addi $sp, $sp, -8
	sw $ra, 0($sp) #guardamos direccion de retorno  
	sw $s1, 4($sp) #guardamos valor de n en el stack
	#paso 1
	add $t3, $zero, $t1 #hacemos copia de la direccion de t2 (torre 2)
	add $t1, $zero, $t2 # t1=t0
	add $t2, $zero, $t3 # t0=t1
	jal Hanoi
	
	lw $ra, 0($sp) #guardamos la direccion de retorno
	lw $s1, 4($sp)#guardamos la n actual
	#paso 2
	add $t3, $zero, $t1 #en t3 hacemos copia de la direccion de end
	add $t1, $zero, $t0 #guardamos el valor de la primera en la ultima
	add $t0, $zero, $t3 #guardamos el valor de la ultima en la primera
	#sacamos el disco
	addi $t1, $t1, -4 #t0 t0 
	sw $zero, 0($t1)
	sw $s1, 0($t2)
	addi $t2, $t2, 4
	
	#paso 3
	addi $s1, $s1, -1
	add $t3, $zero, $t1
	add $t1, $zero, $t0
	add $t0, $zero, $t3
	addi $sp, $sp, -8
	jal Hanoi
	
	lw $ra, 0($sp)
	lw $s1, 4($sp)
	add $t3, $zero, $t1
	add $t1, $zero, $t0
	add $t0, $zero, $t3
	addi $sp, $sp, 8
	jr $ra
	
	
	
	
	Exit: