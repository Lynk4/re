kicking: kicking.o
		gcc -o kicking kicking.o -no-pie
kicking.o: kicking.asm
		nasm -f elf64 -g kicking.asm -o kicking.o -l kicking.lst
		