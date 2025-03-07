#include <fstream>
#include <iostream>

__global__ 
void vecAddkernel(float* A, float* B, float* C, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        C[i] = A[i] * B[i];
    }
    
}   

void vecAdd(float* A_h, float* B_h, float* C_h, int n) {
    int size = n * sizeof(float);
    float *A_d, *B_d, *C_d;

    cudaMalloc((void **) &A_d, size);
    cudaMalloc((void **) &B_d, size);
    cudaMalloc((void **) &C_d, size);

    cudaMemcpy(A_d, A_h, size, cudaMemcpyHostToDevice);
    cudaMemcpy(B_d, B_h, size, cudaMemcpyHostToDevice);

    // invocation

    cudaMemcpy(C_h, C_d, size, cudaMemcpyDeviceToHost);
    
    cudaFree(A_d);
    cudaFree(B_d);
    cudaFree(C_d);

}

int main() {
    std::ifstream ifs("./arrays.txt");
    std::ofstream ofs("./out.txt");
    int total;
    float *A, *B, *C;

    ifs >> total;
    A = new float[total];
    B = new float[total];
    C = new float[total];
    for (size_t i = 0; i < total; i++)
    {
        ifs >> A[i];
    }
    for (size_t i = 0; i < total; i++)
    {
        ifs >> B[i];
    }

    vecAdd(A, B, C, total);

    for (size_t i = 0; i < total; i++)
    {
        ofs << C[i] << ' ';
    }
    
    return 0;
}