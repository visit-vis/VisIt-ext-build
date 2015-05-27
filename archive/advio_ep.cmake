add_hostconfig(advio "VISIT_OPTION_DEFAULT(VISIT_ADVIO_DIR ${advio_install})")
set(advio_cflags "${CMAKE_C_FLAGS} -fPIC")
set(advio_cxxflags "${CMAKE_CXX_FLAGS} -fPIC")
ExternalProject_Add(advio
  SOURCE_DIR ${advio_source}
  BINARY_DIR ${advio_binary}
  INSTALL_DIR ${advio_install}
  URL ${advio_url}
  URL_MD5 ${advio_md5}
  #PATCH_COMMAND ""
  CONFIGURE_COMMAND env CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} CFLAGS=${advio_cflags} CXXFLAGS=${advio_cxxflags} ./configure --prefix=${advio_install}
  BUILD_COMMAND $(MAKE) -j1
  INSTALL_COMMAND $(MAKE) -j1 install
)
