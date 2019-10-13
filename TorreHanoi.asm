# The Hanoi Tower
# Daniel Ruvalcaba, Diego Aceves

.data
	A: .word 0 0 0 0 0 0 0 0  # We reserve memory for each tower
	B: .word 0 0 0 0 0 0 0 0  # We reserve memory for each tower
	C: .word 0 0 0 0 0 0 0 0  # We reserve memory for each tower
.text
	Main:
	li $s0, 8 # This is our variable N
	la $t0, A # Assigning the address of tower A in t0
	la $t1, B # Assigning the address of tower B in t1
	la $t2, C # Assigning the address of tower C in t0 t2
	add $s1, $zero, $s0 # We make a copy of N in S1
	li $s2, 0 # Variable i for vector iteration
	li $t3, 0 # Temporal register for copying addresses
	li $v0, 4 # Constant 4
	mul $v0, $v0, $s0 # This constant will let us know how much memory we have to reserve for the first tower (How many discs are * 4 bytes)
	
	# In MainSort is where we assign the values for the first time in the tower A
	MainSort:
	sll $t3, $s2, 2 # Shift left logical so we can iterate on the array for tower A
	add $t3, $t3, $t0 # We add the shift to the first tower address
	sw $s1, 0($t3) # We save a copy of the actual N in the first position of the array
	addi $s1, $s1 -1 # We substract 1 from N
	addi $s2, $s2, 1 # We do i = i+1
	bne $s1, $zero, MainSort # Checking if we've saved all initial values in tower A
	add $s1, $zero, $s0 # Saved again the N value on s1
	add $t0, $t0, $v0 # We make t0 point to the top of the tower A
	
	jal Hanoi # First time we call recursive function Hanoi
	
	j Exit # End the program
	
	BCase:
	addi $t0, $t0, -4 # We substrac 4 so t0 point to the data
	sw $zero, 0($t0) # We take off the disc
	sw $s1, 0($t2) # We put the disc on top of the C tower
	addi $t2, $t2, 4 # We have a new disc on t2, so we point one place up
	jr $ra # Return
	
	Hanoi:
	# We have to check if this is a Base Case
	beq $s1, 1 , BCase # If N is equal to 1, jump to the Base Case function
	# If it´s not...
	addi $sp, $sp, -8 # Reserving memory 
	sw $ra, 0($sp) # We save de return addres
	sw $s1, 4($sp) # we save the current value of N, so we will not lose it
	
	# Step 1 where we swap B->C
	addi $s1, $s1, -1 # Substract 1 from N
	add $t3, $zero, $t1 # We save the address of tower B on t3 so we can do the swap
	add $t1, $zero, $t2 # Now the address of C is in B
	add $t2, $zero, $t3 # And the address of B is in C
	jal Hanoi # Recursive call to Hanoi
	
	# Poping values of the Stack
	lw $ra, 0($sp) # Saving the return addres
	lw $s1, 4($sp) # Saving the actual value of N
	
	# Before we do Step 2, we need to start undoing the swap we did in step 1
	add $t3, $zero, $t1 # We make a copy of the address of C in t3
	add $t1, $zero, $t2 # We save the address of B in t1
	add $t2, $zero, $t3 # We save the address of C in t2
	
	# We take off the disc of tower A
	addi $t0, $t0, -4 # A will have one disc less, so we make t0 point one place down
	sw $zero, 0($t0) # We take off the top disc of A
	sw $s1, 0($t2) # We put the disc on the top of C tower
	addi $t2, $t2, 4 # C has one new disc so we make t2 point one place up
	
	# Step 2 where we do A->B
	addi $s1, $s1, -1 # We substract 1 from N
	add $t3, $zero, $t1 # We do a copy of the address of B in t3, so we can do the swap
	add $t1, $zero, $t0 # We make t1 have the address of A
	add $t0, $zero, $t3 # And t0 have the address of B
	jal Hanoi # Recursive Call Hanoi
	
	# Poping values of the stack
	lw $ra, 0($sp) # We save the return address
	lw $s1, 4($sp) # we save the actual value of N
	
	# We undo the swap we did in Step 2
	add $t3, $zero, $t1 # We do a copy of the address of A in t3
	add $t1, $zero, $t0 # We make t1 have the address of B tower
	add $t0, $zero, $t3 # And t0 have the address of A
	addi $sp, $sp, 8 # We reset stack pointer
	jr $ra # Return where ra 
	
	Exit:
