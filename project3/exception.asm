lw $t0,($s2)#load input
lw $t1,($s1)#load output
beq $t0,$t1,equal
sw $t0,($s1)#if not equal, output = input
sw $t0,4($s1)
j exit
equal:lw $t2,4($s1)#if equal, output+=1
addiu $t2,$t2,1
sw $t2,4($s1)
exit:ori $t3,$0,10
sw $t3,4($s0)#reset CTRL
ori $t4,$0,9
sw $t4,($s0)#reset PRESET
eret
