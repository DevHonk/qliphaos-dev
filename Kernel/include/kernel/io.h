#pragma once

#ifndef _IO_H_
#define _IO_H_

#include <kernel/types.h>

void out8(u16 port, u8 value);
void out16(u16 port, u16 value);
void out32(u16 port, u32 value);

u8 in8(u16 port);
u16 in16(u16 port);
u32 in32(u16 port);

#endif