ASM = nasm
ASMFLAGS = -f elf64
LD = ld

SRC := $(wildcard src/*.asm)
OBJ := $(SRC:.asm=.o)

program: $(OBJ)
	$(LD) -o $@ $(OBJ)
	rm src/*.o

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	rm src/*.o program

