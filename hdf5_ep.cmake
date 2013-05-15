add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_DIR ${hdf5_install})")
add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP ${szip_install}/lib sz /usr/lib/x86_64-linux-gnu z TYPE STRING)")

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--disable-shared --enable-static")
#else()
#    set(extra_args "--enable-shared --disable-static")
endif()

ExternalProject_Add(hdf5
  SOURCE_DIR ${hdf5_source}
  BINARY_DIR ${hdf5_binary}
  INSTALL_DIR ${hdf5_install}
  URL ${hdf5_url}
  URL_MD5 ${hdf5_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} --prefix=${hdf5_install} --with-szlib=${sz_install} ${extra_args}
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
