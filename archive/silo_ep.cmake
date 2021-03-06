add_hostconfig(silo "VISIT_OPTION_DEFAULT(VISIT_SILO_DIR ${silo_install})")
add_hostconfig(silo "VISIT_OPTION_DEFAULT(VISIT_SILO_LIBDEP HDF5_LIBRARY_DIR hdf5 \${VISIT_HDF5_LIBDEP} TYPE STRING)")

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--static")
endif()

ExternalProject_Add(silo
  DOWNLOAD_COMMAND ${WGET} ${silo_url} -O ${CMAKE_CURRENT_BINARY_DIR}/${silo_file}
  UPDATE_COMMAND tar xvzf ${CMAKE_CURRENT_BINARY_DIR}/${silo_file} -C ${CMAKE_BINARY_DIR}
  SOURCE_DIR ${silo_source}
  BINARY_DIR ${silo_binary}
  INSTALL_DIR ${silo_install}
  URL ${silo_url}
  URL_MD5 ${silo_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} --prefix=${silo_install} --with-hdf5=${hdf5_install}/include,${hdf5_install}/lib --with-szlib=${szip_install} --with-zlib=${zlib_install}/include,${zlib_install}/lib --disable-silex ${extra_args}
  #BUILD_COMMAND $(MAKE)
  #INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
