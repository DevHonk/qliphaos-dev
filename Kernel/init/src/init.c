/**
 * QliphaOS/Dev - Kernel / Init
 *
 * @contributors:
 * Chaika9 <https://github.com/Chaika9>;
*/

#include <kernel/multiboot.h>
#include <kernel/kernel.h>
#include <kernel/kassert.h>
#include <kernel/types.h>

/**
 * Main (i386) function.
 * Multiboot (i386-pc)
 *
 * @param mb_info Multiboot header pointer.
 * @param mb_mag Multiboot header magic.
 * @param esp EFI System Partition.
 **/
void init_i386(multiboot_info_t *mb_info, u32 mb_mag, u32 esp)
{
    kassert(mb_mag == MULTIBOOT_EAX_MAGIC && "Multiboot not detect!");
    init_kernel(mb_info, esp);
}