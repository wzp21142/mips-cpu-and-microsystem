addi $8,$8,4294967295
bgezal $8,begin
addi $8,$8,1
addi $8,$8,1
bgezal $8,begin
subi $8,$8,2
begin:
addi $8,$8,1