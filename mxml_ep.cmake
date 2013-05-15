add_hostconfig(mxml "VISIT_OPTION_DEFAULT(VISIT_MXML_DIR ${mxml_install})")

ExternalProject_Add(mxml
  SOURCE_DIR ${mxml_source}
  BINARY_DIR ${mxml_binary}
  INSTALL_DIR ${mxml_install}
  URL ${mxml_url}
  URL_MD5 ${mxml_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} --prefix=${mxml_install} --disable-threads
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
