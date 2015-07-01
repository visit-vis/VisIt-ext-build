add_hostconfig(zlib "VISIT_OPTION_DEFAULT(VISIT_ZLIB_DIR \"${zlib_install}\")")

if(WIN32)
  if(${VISIT_BUILD_TYPE} MATCHES "Release")
    add_hostconfig(zlib "SET(ZLIB_LIB_NAME zlib)")
  else()
    add_hostconfig(zlib "SET(ZLIB_LIB_NAME zlib_d)")
  endif()
endif()

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--static")
endif()


if(WIN32)
ExternalProject_Add(zlib
  SOURCE_DIR ${zlib_source}
  BINARY_DIR ${zlib_binary}
  INSTALL_DIR ${zlib_install}
  URL ${zlib_url}
  URL_MD5 ${zlib_md5}
  CMAKE_ARGS -DBUILD_SHARED_LIBS:BOOL=ON -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
  #${ep_log_options}
  )
else()
ExternalProject_Add(zlib
  SOURCE_DIR ${zlib_source}
  BINARY_DIR ${zlib_binary}
  INSTALL_DIR ${zlib_install}
  URL ${zlib_url}
  URL_MD5 ${zlib_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure --prefix=${zlib_install} ${extra_args}
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
endif()
