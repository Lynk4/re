exabyte: exabyte.o
	gcc -o exabyte exabyte.o -no-pie
exabyte.o: exabyte.asm
	nasm -f elf64 -g exabyte.asm -o exabyte.o -l exabyte.lst