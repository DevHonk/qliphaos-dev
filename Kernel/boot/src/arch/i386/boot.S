/**
 * QliphaOS/Dev - Kernel / Boot
 *
 * @contributors:
 * Chaika9 <https://github.com/Chaika9>;
*/

.set MULTIBOOT_MAGIC,       0x1badb002 # The magic field should contain Multiboot header.
.set MULTIBOOT_PAGE_ALIGN,  1 << 0
.set MULTIBOOT_MEMORY_INFO, 1 << 1
.set MULTIBOOT_VIDEO_MODE,  1 << 2
.set MULTIBOOT_FLAGS,       MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO | MULTIBOOT_VIDEO_MODE
.set MULTIBOOT_CHECKSUM,    -(MULTIBOOT_MAGIC + MULTIBOOT_FLAGS)

.section .multiboot
.align 4

/* Multiboot section */
.long MULTIBOOT_MAGIC
.long MULTIBOOT_FLAGS
.long MULTIBOOT_CHECKSUM

/* MULTIBOOT_MEMORY_INFO */
.long 0x00000000 # header_addr
.long 0x00000000 # load_addr
.long 0x00000000 # load_end_addr
.long 0x00000000 # bss_end_addr
.long 0x00000000 # entry_addr

/* MULTIBOOT_VIDEO_MODE : Request linear graphics mode */
.long 0x00000000 # mode_type
.long 0 # width
.long 0 # height
.long 32 # depth

/* .stack resides in .bss */
.section .stack, "aw", @nobits
stack_bottom:
.skip 32768 # 32 KiB
stack_top:

.section .text

.global start
.type start, @function

.extern init_i386
.type init_i386, @function

start:
    /* Setup our stack */
    mov $stack_top, %esp

    /* Make sure our stack is 16-byte aligned */
    and $-16, %esp

    pushl %esp /* EFI System Partition. */
    pushl %eax /* Multiboot header magic */
    pushl %ebx /* Multiboot header pointer */

    /* Disable interrupts and call init proper */
    cli
    call init_i386

    cli

loop:
    hlt
    jmp loop
