#pragma once

#ifndef _KERNEL_H_
#define _KERNEL_H_

#include <kernel/multiboot.h>
#include <kernel/types.h>

void init_kernel(multiboot_info_t *mb_info, u32 esp);

#endif