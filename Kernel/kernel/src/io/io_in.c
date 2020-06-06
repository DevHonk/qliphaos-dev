/**
 * QliphaOS/Dev - Kernel
 *
 * @contributors:
 * Chaika9 <https://github.com/Chaika9>;
*/

#include <kernel/io.h>
#include <kernel/types.h>

/**
 * In (return u8)
 *
 * @param port
 *
 * @return u8
 **/
u8 in8(u16 port)
{
    u8 value;

    asm volatile ("inb %1, %0"
                 : "=a"(value)
                 : "Nd"(port));
    return value;
}

/**
 * In (return u16)
 *
 * @param port
 *
 * @return u16
 **/
u16 in16(u16 port)
{
    u16 value;

    asm volatile ("inw %1, %0"
                 : "=a"(value)
                 : "Nd"(port));
    return value;
}

/**
 * Int (return u32)
 *
 * @param port
 *
 * @return u32
 **/
u32 in32(u16 port)
{
    u32 value;

    asm volatile ("inl %1, %0"
                 : "=a"(value)
                 : "Nd"(port));
    return value;
}