.text	# 0x00000000 (Início do código)
.globl _start
_start:
    # Aponta s0 para a base dos dados em 0x80
    addi s0, zero, 0x80
    # Aponta s1 para o registrador do display HEX [cite: 8]
    addi s1, zero, 0x108
    
    # Carrega os valores iniciais de 'a' (mem[0x80]) e 'b' (mem[0x84])
    lw t0, 0(s0)
    lw t1, 4(s0)
    
loop:
    add t2, t1, t0  # t2 = f(n-1) + f(n-2)
    add t0, zero, t1  # Atualiza f(n-2)
    add t1, zero, t2  # Atualiza f(n-1)
    
    # Armazena o novo valor na próxima posição da RAM (opcional, mas bom)
    addi s0, s0, 4
    sw t2, (s0)
    
    # Escreve o resultado no display HEX [cite: 12]
    sw t2, (s1)
    
    j loop
	
.data	# 0x00000080 (Início dos dados, dentro da RAM mas fora do código)
a:	.word 0
b:	.word 1