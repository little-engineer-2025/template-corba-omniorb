# Buscar la biblioteca OmniORB
find_package(OmniORB REQUIRED)

# Configuracion de los includes de OmniORB
include_directories(${OMNIORB_INCLUDE_DIR})

# Configuración de los archivos IDL
set(IDL_FILES hello.idl)

# Compilar los archivos IDL
omniorb_idl_compile(${IDL_FILES} GENERATE_CPP)

# Configuración de los archivos de código fuente
file(GLOB SOURCE_FILES *.cpp)
list(APPEND SOURCE_FILES ${OMNIORB_IDL_CPP_FILES})

# Configuración de los ejecutables
add_executable(hello_server ${SOURCE_FILES})
target_link_libraries(hello_server ${OMNIORB_LIBRARIES})

add_executable(hello_client ${SOURCE_FILES})
target_link_libraries(hello_client ${OMNIORB_LIBRARIES})

# Configuración de los flags de enlace
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -lomniORB4 -lomniDynamic4")
