include(${CMAKE_SOURCE_DIR}/cmake/OmniORBConfig.cmake)

function(omniorb_idl_compile idl_files generate_cpp)
  foreach(idl_file ${idl_files})
    get_filename_component(idl_filename ${idl_file} NAME_WE)
    set(cpp_file ${idl_filename}_sk.cc)
    set(h_file ${idl_filename}.hh)
    add_custom_command(
      OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/${cpp_file} ${CMAKE_CURRENT_SOURCE_DIR}/${h_file}
      COMMAND ${OMNIORB_IDL_COMPILER} -C${CMAKE_CURRENT_SOURCE_DIR} -bcxx ${CMAKE_CURRENT_SOURCE_DIR}/${idl_file}
      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${idl_file}
    )
    set(OMNIORB_IDL_CPP_FILES ${OMNIORB_IDL_CPP_FILES} ${CMAKE_CURRENT_SOURCE_DIR}/${cpp_file})
  endforeach()
  set(OMNIORB_IDL_CPP_FILES ${OMNIORB_IDL_CPP_FILES} PARENT_SCOPE)
endfunction()
