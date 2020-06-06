/**
 * QliphaOS/Dev - Kernel
 *
 * @contributors:
 * Chaika9 <https://github.com/Chaika9>;
*/

#include <kernel/io.h>
#include <kernel/types.h>

/**
 * Out (value u8)
 *
 * @param port
 * @param value
 **/
void out8(u16 port, u8 value)
{
    asm volatile ("outb %0, %1" ::"a"(value), "Nd"(port));
}

/**
 * Out (value u16)
 *
 * @param port
 * @param value
 **/
void out16(u16 port, u16 value)
{
    asm volatile ("outw %0, %1" ::"a"(value), "Nd"(port));
}

/**
 * Out (value u32)
 *
 * @param port
 * @param value
 **/
void out32(u16 port, u32 value)
{
    asm volatile ("outl %0, %1" ::"a"(value), "Nd"(port));
}