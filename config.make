AS = as --32
CC = gcc -pipe
LD = ld

C_STANDARD_FLAGS =
C_WARNING_FLAGS = -Werror -Wextra -Wall -Wno-nonnull-compare -Wno-address-of-packed-member -Wundef -Wcast-qual -Wwrite-strings -Wimplicit-fallthrough -Wno-expansion-to-defined
C_FLAVOR_FLAGS = -fno-exceptions -fstack-protector -fno-pic

LD_FLAGS = -m elf_i386 -nostdlib

ARCH_FLAGS = -m32 -march=i686
OPTIMIZATION_FLAGS = -Os

INCLUDE_FLAGS =

C_FLAGS = -MMD -MP $(C_FLAVOR_FLAGS) $(ARCH_FLAGS) $(C_STANDARD_FLAGS) $(C_SUGGEST_FLAGS) $(INCLUDE_FLAGS)

.S.o:
	@echo "$(notdir $(CURDIR)): ASM '$<'"
	$(AS) -c -o $*.o $<

.c.o:
	@echo "$(notdir $(CURDIR)): C '$<'"
	$(CC) $(C_FLAGS) -c -o $*.o $<

clean:
	@find . \( -name "*.o" -o -name "*.d" -o -name "*.elf" -o -name "*.iso" \) -delete