add_hostconfig(szip "VISIT_OPTION_DEFAULT(VISIT_SZIP_DIR ${szip_install})")

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--disable-shared --enable-static")
endif()

ExternalProject_Add(szip
  SOURCE_DIR ${szip_source}
  BINARY_DIR ${szip_binary}
  INSTALL_DIR ${szip_install}
  URL ${szip_url}
  URL_MD5 ${szip_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} LIBS=-lm --prefix=${szip_install} ${extra_args}
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
