#ifndef VEC_ADD_H
#define VEC_ADD_H
#include <cuda_runtime.h>

__global__ void vecAddkernel(float*, float*, float*, int);

void vecAdd(float*, float*, float*, int);

#endif
