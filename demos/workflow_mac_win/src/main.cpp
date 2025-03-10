#include <fstream>
#include <iostream>
#include "vecAdd.h"

int main() {
    std::ifstream ifs("../arrays.txt");
    std::ofstream ofs("../out.txt");
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