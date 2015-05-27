add_hostconfig(mesa "VISIT_OPTION_DEFAULT(VISIT_MESA_DIR ${mesa_install})")

set(extra_args --without-demos --disable-gallium --with-driver=xlib --enable-gl-osmesa --enable-glx-tls --disable-glw --disable-glu --disable-egl)

if(VISIT_STATIC)
    set(extra_args "${extra_args} --disable-shared --enable-static")
endif()

set(HACK_FLAGS "")
set(AIX_MESA_CFLAGS "")
if(LINUX)
    set(HACK_FLAGS -fPIC -DGLX_USE_TLS)
endif()

set(cflags "-DUSE_MGL_NAMESPACE -fPIC ${HACK_FLAGS} ${CMAKE_C_FLAGS}")
set(cxxflags "-DUSE_MGL_NAMESPACE -fPIC ${HACK_FLAGS} ${CMAKE_CXX_FLAGS}")

ExternalProject_Add(mesa
  SOURCE_DIR ${mesa_source}
  BINARY_DIR ${mesa_binary}
  INSTALL_DIR ${mesa_install}
  URL ${mesa_url}
  URL_MD5 ${mesa_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} CFLAGS=${cflags} CXXFLAGS=${cxxflags}  --prefix=${mesa_install} ${extra_args}
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
