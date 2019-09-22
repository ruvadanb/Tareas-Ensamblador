.data
Vector1: .word 1 2 3 #s1
Vector2: .word 6 7 8 #s2
Result: .word 0 #s3

.text
main:
	la $s1, Vector1
	la $s2, Vector2
	la $s3, Result
	li $a0, 3 # k=3
	li $t0, 0 # i=0
	li $t1, 0 #temporal register
	li $t2, 0 #temporal register
	
multAndAccumulate:
	sll $t1, $t0, 2 #shift left i
	lw $t2, $t1
	add $t1, $t1, $s1 #Adding an offset
	add $t2, $t2, $s2 #Adding offset
	lw $t3, 0($t1) #Leemos el 1 y lo guardamos en t3
	lw $t4, 0($t2) #Leemos el 6 y lo guardamos en t4
	
	
	