/*------------------------------------------------------------------------------
Copyright © 2016 by Nicola Bombieri

XLib is provided under the terms of The MIT License (MIT):

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
------------------------------------------------------------------------------*/
/**
 * @author Federico Busato
 * Univerity of Verona, Dept. of Computer Science
 * federico.busato@univr.it
 */
#pragma once
/*
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#include <cub/cub.cuh>
#pragma GCC diagnostic pop*/

namespace xlib {

enum class BLOCK_MODE  { SIMPLE, UNROLL, Min, SHAREDMEM, SHAREDMEM_UNROLL };

template<int BlockSize, BLOCK_MODE mode = BLOCK_MODE::SIMPLE,
         cub::CacheStoreModifier CM = cub::CacheStoreModifier::STORE_DEFAULT,
         int Items_per_warp = 0>
struct block_dyn {

    template<typename T, int SIZE>
    static void regToGlobal(T (&Queue)[SIZE],
                            const int size,
                            int thread_offset,
                            const int total,           // optional
                            T* __restrict__ SMem,      // optional
                            T* __restrict__ devPointer);
};

} // namespace xlib

#include "impl/BlockDynamic.i.cuh"