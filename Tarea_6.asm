.data

.text
	#Daniel Ruvalcaba Barboza 715472
	
	# $a0 es nuestra N
	
	main:
	li $a0, 5 #s0 Sera N
	add $t2, $zero, $a0 # copiamos n en t2 para validar el caso base
	addi $a0, $a0, -1 # por el algoritmo restamos 1 a N
	li $t4, 1 # constante
	li $t5, 2 #constante
	jal fibonacci #Llamamos por primera vez a la función recursiva
	add $s0, $zero, $v0 #Pasamos el valor de v0 que nos retorna la funcion en s0
	j exit #salimos del programa
	
	#fibonacci funcion recursiva
	fibonacci:
	slti $t3, $t2, 3 #verificamos para el caso base
	beq $t3, $t4, casobase # si t3<2 entonces saltamos a caso base
	slti $t0, $a0, 2 #checamos si a0=n<2, si sí t0=1
	beq $t0, $zero, general #nos vamos a loop en caso de n>=2
	add $v0, $zero, $s0 #pasamos el resultado a la variable de la funcion (v0)
	j pop # Hacemos un pop de la pila
	
	casobase:
	beq $t2, $t5, caso_n_2 # checamos el caso de que n=2
	addi $a0, $a0, 1 #en caso de que n<=1 sumamos 1 a a0(n)
	add $v0, $v0, $a0#Pasamos el dato a la varible de la funcion #v0
	jr $ra #regresamos a donde llamamos
	
	caso_n_2:
	add $v0, $v0, $a0 #Simplemente pasamos el dato de n a la variable de la funcion
	jr $ra #regresamos a donde llamamos
	
	general:
	addi $sp, $sp, -12 #reservamos espacio en el stack
	sw $ra, 0($sp) #guardamos el valor de ra en la primer posicion
	sw $s0, 4($sp) #guardamos el valor de s0 en la segunda posicion
	sw $t1, 8($sp) #guardamos el valor de t1 en la tercer posicion
	
	add $s0, $zero, $a0 #Pasamos vallor de n a s0
	addi $a0, $s0, -1 #decremendamos a N -1
	jal fibonacci #Llamamos funcion fibonacci con n-1
	add $t1, $zero, $v0 # pasamos el valor de v0 de la llamada fibonacci en t1
	
	addi $a0, $s0, -2 #n-2
	jal fibonacci #llamamos a la funcion con n-2
	add $v0, $t1, $v0 # Hacemos la suma de fibonacci(n-1)+fibonacci(n-2)

	#hacemos pop de los datos
	pop:
	lw $ra, 0($sp) #guardamos la direccion del tope de pila
	lw $s0, 4($sp) #guardamos n actual
	lw $t1, 8($sp) #guardamos el resultado
	addi $sp, $sp, 12 #reiniciamos el stack
	jr $ra #regresamos a donde llamamos

	exit:
	
