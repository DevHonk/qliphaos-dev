/**
 * QliphaOS/Dev - Kernel
 *
 * @contributors:
 * Chaika9 <https://github.com/Chaika9>;
*/

/**
 * QliphaOS/Dev - Kernel
 * @version 0.0.01-d01-dev
 **/

#include <kernel/multiboot.h>
#include <kernel/types.h>

/**
 * Kernel initialization.
 * Multiboot (i386-pc)
 *
 * @param mb_info Multiboot header pointer.
 * @param esp EFI System Partition.
 **/
void init_kernel(multiboot_info_t *mb_info, u32 esp)
{}