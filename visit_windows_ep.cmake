if(WIN32)
add_hostconfig(visit_windows "VISIT_OPTION_DEFAULT(VISIT_WINDOWS_DIR \"${CMAKE_INSTALL_PREFIX}\")")

ExternalProject_Add(visit_windows
  SOURCE_DIR ${windows_source}
  BINARY_DIR ${windows_binary}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  SVN_REPOSITORY ${windows_url}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_BINARY_DIR}/${windows_source} <INSTALL_DIR>/distribution
  )
endif()
