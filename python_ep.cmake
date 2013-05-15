add_hostconfig(python "VISIT_OPTION_DEFAULT(VISIT_PYTHON_DIR ${python_install})")

set(extra_args "")

if(NOT VISIT_STATIC)
    set(extra_args "${extra_args} --enable-shared")
endif()



set(cflags "-fPIC ${CMAKE_C_FLAGS}")
set(cxxflags "-fPIC ${CMAKE_CXX_FLAGS}")

ExternalProject_Add(python
  SOURCE_DIR ${python_source}
  BINARY_DIR ${python_binary}
  INSTALL_DIR ${python_install}
  URL ${python_url}
  URL_MD5 ${python_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure OPT=${CMAKE_C_FLAGS} LDFLAGS=${CMAKE_EXE_LINKER_FLAGS} CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} CFLAGS=${cflags} CXXFLAGS=${cxxflags} --prefix=${python_install} ${extra_args} --disable-ipv6 --enable-shared
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) -j1 install
  #${ep_log_options}
  )
