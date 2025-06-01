# Configuración de OmniORB

# Versión de OmniORB
set(OMNIORB_VERSION "4.2.1")

# Directorio de instalación de OmniORB
set(OMNIORB_INSTALL_DIR "/usr")

# Directorio de includes de OmniORB
set(OMNIORB_INCLUDE_DIRS "${OMNIORB_INSTALL_DIR}/include")

# Directorio de bibliotecas de OmniORB
set(OMNIORB_LIBRARY_DIRS "${OMNIORB_INSTALL_DIR}/lib")

# Bibliotecas de OmniORB
set(OMNIORB_LIBRARIES "omniORB4 omniDynamic4")

# Compilador IDL de OmniORB
set(OMNIORB_IDL_COMPILER "${OMNIORB_INSTALL_DIR}/bin/omniidl")

# Flags de compilación de OmniORB
set(OMNIORB_CXX_FLAGS "-I${OMNIORB_INCLUDE_DIRS} -L${OMNIORB_LIBRARY_DIRS} -lomniORB4 -lomniDynamic4")
