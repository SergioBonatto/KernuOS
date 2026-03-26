LD = i686-elf-ld
AS = nasm

LDFLAGS = -T link.ld -melf_i386

kernel.elf: loader.o
	$(LD) $(LDFLAGS) loader.o -o kernel.elf

loader.o: loader.s
	$(AS) -f elf32 loader.s -o loader.o

clean:
	rm -f *.o *.elf
