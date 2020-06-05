all:
	make -sC boot
	make -sC init
	make -sC kernel
	@sh ../Toolchain/utils/compile.sh "$(notdir $(CURDIR))" "$(LD)" "$(LD_FLAGS)" "ld/kernel.ld" "kernel.elf"

include ../config.make