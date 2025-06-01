cmake_minimum_required(VERSION 3.10)
project(hello)

# Set include directory
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
list(APPEND SOURCE_FILES "${CMAKE_SOURCE_DIR}/src")
#include(OmniORBConfig)

# Configuración del compilador
set(CMAKE_CXX_COMPILER clang++)

# Buscar la biblioteca OmniORB
find_package(OmniORB REQUIRED)

# Configuración de los includes de OmniORB
include_directories(${OMNIORB_INCLUDE_DIR})

# Configuración de los flags de compilación
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# Configuración de los archivos IDL
set(IDL_FILES hello.idl)

# Compilar los archivos IDL
omniorb_idl_compile(${IDL_FILES} GENERATE_CPP)

# Configuración de los archivos de código fuente
set(SOURCE_FILES
  hello.cpp
  hello_client.cpp
  hello_server.cpp
  ${OMNIORB_IDL_CPP_FILES}
)

# Configuración de los ejecutables
add_executable(hello_server ${SOURCE_FILES})
target_link_libraries(hello_server ${OMNIORB_LIBRARIES})

add_executable(hello_client ${SOURCE_FILES})
target_link_libraries(hello_client ${OMNIORB_LIBRARIES})

# Configuración de los flags de enlace
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -lomniORB4 -lomniDynamic4")
