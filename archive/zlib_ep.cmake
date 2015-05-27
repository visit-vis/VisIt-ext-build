add_hostconfig(zlib "VISIT_OPTION_DEFAULT(VISIT_ZLIB_DIR ${zlib_install})")

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--static")
endif()

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
