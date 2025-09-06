# Course 1 - Hello CUDA程序

# 创建可执行文件
add_executable(hello hello.cu)

# 设置CUDA相关属性
set_target_properties(hello PROPERTIES
    CUDA_RESOLVE_DEVICE_SYMBOLS ON
)

# 链接CUDA库（现代方式）
target_link_libraries(hello PRIVATE CUDA::cudart)