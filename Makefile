LD	= i686-elf-ld
CC	= i686-elf-gcc
AS	= nasm

OBJECTS	=	loader.o kmain.o
CFLAGS	=	-m32 -nostdlib -fno-builtin -fno-stack-protector \
			-nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c

LDFLAGS	=	-T link.ld -melf_i386
ASFLAGS	=	-f elf32

all: kernel.elf

kernel.elf: $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o kernel.elf

KernuOS.iso: Kernel.elf
	cp kernel.elf iso/boot/kernel.elf
	i686-elf-grub-mkrescue -o KernuOS.iso iso

run: KernuOS.iso
	qemu-system-i386 -cdrom KernuOS.iso

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean: 
	rm -rf *.o kernel.elf KernuOS.is
