/**
 * QliphaOS/Dev - Kernel
 *
 * @contributors:
 * Chaika9 <https://github.com/Chaika9>;
*/

#include <kernel/kassert.h>
#include <kernel/types.h>

void kassert_failed(const char *file, u32 line, const char *expr)
{
    // TODO: halt, print debug error.
}