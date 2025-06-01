cmake_minimum_required(VERSION 3.10)
project(hello)

# Set include directory
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Configuración del compilador
set(CMAKE_CXX_COMPILER clang++)

add_subdirectory(src)
