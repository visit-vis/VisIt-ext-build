
add_hostconfig(adios "VISIT_OPTION_DEFAULT(VISIT_ADIOS_DIR ${adios_install})")

set(adios_cflags "${CMAKE_C_FLAGS} -fPIC")
set(adios_cxxflags "${CMAKE_CXX_FLAGS} -fPIC")

ExternalProject_Add(adios
  #DEPENDS ${adios_deps}
  SOURCE_DIR ${adios_source}
  BINARY_DIR ${adios_binary}
  INSTALL_DIR ${adios_install}
  URL ${adios_url}
  URL_MD5 ${adios_md5}
  #PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} CFLAGS=${adios_cflags} CXXFLAGS=${adios_cxxflags} --disable-fortran --prefix=${adios_install} --with-mxml=${mxml_install} --without-mpi
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
)


