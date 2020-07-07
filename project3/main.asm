ori $s0,$0,0x7f00
ori $s1,$0,0x7f10
ori $s2,$0,0x7f20#s0~s2:counter,output,input
lw $t0,($s2)
sw $t0,($s1)
sw $t0,4($s1)
ori $t1,$0,0x0401
mtc0 $t1,$12#initialization of SR
mfc0 $s3,$15#test mfc0
ori $t2,$0,10
sw $t2,4($s0)#initialization of counter's PRESET
ori $t3,$0,9
sw $t3,($s0)#initialization of counter's CTRL
loop:j loop
