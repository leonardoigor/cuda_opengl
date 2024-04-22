cmake_minimum_required(VERSION 3.20)

project(Cuda_OpenGl)

find_package(CUDA REQUIRED)

find_package(OpenGL REQUIRED)

# Pass options to NVCC
set(CUDA_NVCC_FLAGS "-arch=sm_80")
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)

include_directories(
    src/include

    ${OPENGL_INCLUDE_DIRS}

    # ${GLUT_INCLUDE_DIRS}
    # ${GLEW_INCLUDE_DIRS}
)

# utils include
add_library(${PROJECT_NAME}_utils
    src/utilities.cpp)
target_link_libraries(${PROJECT_NAME}_utils
    ${OPENGL_LIBRARIES})

# kernels
cuda_add_library(${PROJECT_NAME}_kernels
    src/kernels/cuda_kernels.cu)
target_link_libraries(${PROJECT_NAME}_kernels
    ${PROJECT_NAME}_utils
)
cuda_add_library(${PROJECT_NAME}_cuda
    src/kernels/cuda_kernels.cu)
target_link_libraries(${PROJECT_NAME}_cuda
    ${PROJECT_NAME}_kernels
    ${PROJECT_NAME}_utils

    ${OPENGL_LIBRARIES}
)

# end kernels
cuda_add_executable(${PROJECT_NAME}.exe src/main.cpp)

target_link_libraries(${PROJECT_NAME}.exe
    ${PROJECT_NAME}_cuda)