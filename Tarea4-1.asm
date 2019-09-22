.data
Vector1: .word 1 2 3 #s1
Vector2: .word 6 7 8 #s2
Result: .word 0 #s3

.text
main:
	la $s1, Vector1 #guardamos la direccion del vector
	la $s2, Vector2
	la $s3, Result
	li $a0, 4 # k-1=3
	li $t0, 0 # i=0
	li $t1, 0 #temporal register
	li $t2, 0 #temporal register
	li $t5, 0 # Acc

for:
	subi $a0, $a0,1
	slti $t6, $a0, 1
	beq $t6, $zero, multAndAccumulate
	j Exit
	
multAndAccumulate:
	sll $t1, $t0, 2 #shift left i
	sll $t2, $t0, 2
	add $t1, $t1, $s1 #Adding an offset
	add $t2, $t2, $s2 #Adding offset
	lw $t3, 0($t1) #Leemos el 1 y lo guardamos en t3
	lw $t4, 0($t2) #Leemos el 6 y lo guardamos en t4
	mul $t7, $t3, $t4 #t7=mulres
	jal Accumulate #llamamos a la fucnion que suma
	addi $t0, $t0, 1 #incrementamos i
	j for #regresamos al for
	
Accumulate:
	add $t5, $t5, $t7  #sumamos todo en el acumulador
	jr $ra #regresamos a donde nos invocaron
	
Exit:	

	
	
