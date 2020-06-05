#pragma once

#include <kernel/types.h>

#define MULTIBOOT_MAGIC 0x1BADB002
#define MULTIBOOT_EAX_MAGIC 0x2BADB002
#define MULTIBOOT_FLAG_MEM 0x001
#define MULTIBOOT_FLAG_DEVICE 0x002
#define MULTIBOOT_FLAG_CMDLINE 0x004
#define MULTIBOOT_FLAG_MODS 0x008
#define MULTIBOOT_FLAG_AOUT 0x010
#define MULTIBOOT_FLAG_ELF 0x020
#define MULTIBOOT_FLAG_MMAP 0x040
#define MULTIBOOT_FLAG_DRIVE 0x080
#define MULTIBOOT_FLAG_CONFIG 0x100
#define MULTIBOOT_FLAG_LOADER 0x200
#define MULTIBOOT_FLAG_APM 0x400
#define MULTIBOOT_FLAG_VBE 0x800
#define MULTIBOOT_FLAG_FB 0x1000

/**
 * The symbol table for a.out
 **/
typedef struct {
    u32 tabsize;
    u32 strsize;
    u32 addr;
    u32 reserved;
} multiboot_aout_symbol_table_t;

/**
 * The section header table for ELF
 **/
typedef struct {
    u32 num;
    u32 size;
    u32 addr;
    u32 shndx;
} multiboot_elf_section_header_table_t;

struct multiboot_mmap_entry {
    u32 size;
    u64 addr;
    u64 length;
    u32 type;
} __attribute__((packed));
typedef struct multiboot_mmap_entry multiboot_memory_map_t;

/**
 * General Multiboot tag structure
 **/
typedef struct multiboot_info {
    u32 flags; // Multiboot info version number

    /* Available memory from BIOS */
    u32 mem_lower;
    u32 mem_upper;

    /* "root" partition */
    u32 boot_device;

    /* Kernel command line */
    u32 cmdline;

    /* Boot-Module list */
    u32 mods_count;
    u32 mods_addr;

    union {
        multiboot_aout_symbol_table_t aout_sym;
        multiboot_elf_section_header_table_t elf_sec;
    } u;

    /* Memory Mapping buffer */
    u32 mmap_length;
    u32 mmap_addr;

    /* Drive Info buffer */
    u32 drives_length;
    u32 drives_addr;

    /* ROM configuration table */
    u32 config_table;

    /* Boot Loader Name */
    u32 boot_loader_name;

    /* APM table */
    u32 apm_table;

    /* Video */
    u32 vbe_control_info;
    u32 vbe_mode_info;
    u16 vbe_mode;
    u16 vbe_interface_seg;
    u16 vbe_interface_off;
    u16 vbe_interface_len;

    u64 framebuffer_addr;
    u32 framebuffer_pitch;
    u32 framebuffer_width;
    u32 framebuffer_height;
    u8 framebuffer_bpp;
    u8 framebuffer_type;
} multiboot_info_t;