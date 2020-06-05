#pragma once

#ifndef _KASSERT_H_
#define _KASSERT_H_

#include <kernel/types.h>

#define kassert(expr) ((expr) ? FALSE : kassert_failed(__FILE__, __LINE__, #expr))

void kassert_failed(const char *file, u32 line, const char *expr);

#endif