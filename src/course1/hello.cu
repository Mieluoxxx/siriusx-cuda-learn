#include <cuda_runtime.h>
#include <iostream>

// CUDA内核函数：在GPU上执行的函数
__global__ void hello_world(void) {
    // 打印当前线程的块索引和线程索引
    printf("block idx:%d thread idx: %d\n", blockIdx.x, threadIdx.x);
    
    // 只有每个块的第一个线程（线程索引为0）才打印Hello world
    if (threadIdx.x == 0) {
        printf("GPU: Hello world!\n");
    }
}

int main(int argc, char **argv) {
    printf("CPU: Hello world!\n");
    
    // 启动CUDA内核：1个线程块，每个块有10个线程
    hello_world<<<1, 10>>>();
    
    // 等待GPU完成所有操作
    cudaDeviceSynchronize();
    
    // 检查CUDA操作是否出错
    if (cudaGetLastError() != cudaSuccess) {
        std::cerr << "CUDA error: " << cudaGetErrorString(cudaGetLastError())
                  << std::endl;
        return 1;
    } else {
        std::cout << "GPU: Hello world finished!" << std::endl;
    }
    
    std::cout << "CPU: Hello world finished!" << std::endl;
    return 0;
}