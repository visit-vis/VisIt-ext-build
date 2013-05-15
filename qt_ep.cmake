add_hostconfig(qt "VISIT_OPTION_DEFAULT(VISIT_QT_DIR ${qt_install})")
add_hostconfig(qt "VISIT_OPTION_DEFAULT(VISIT_QT_BIN ${qt_install}/bin)")

set(extra_args "")

set(qt_flags ${qt_flags} -no-qt3support)
set(qt_flags ${qt_flags} -no-dbus)
set(qt_flags ${qt_flags} -no-sql-db2 -no-sql-ibase -no-sql-mysql -no-sql-oci)
set(qt_flags ${qt_flags} -no-sql-odbc -no-sql-psql -no-sql-sqlite)
set(qt_flags ${qt_flags} -no-sql-sqlite2 -no-sql-tds)
set(qt_flags ${qt_flags} -no-libtiff)
set(qt_flags ${qt_flags} -no-libjpeg)
set(qt_flags ${qt_flags} -nomake docs)
set(qt_flags ${qt_flags} -nomake examples)
set(qt_flags ${qt_flags} -nomake demos)
set(qt_flags ${qt_flags} -opensource)
set(qt_flags ${qt_flags} -confirm-license)
set(extra_qt_flags -no-webkit -no-phonon -no-phonon-backend -no-openssl)

#-platform ${QT_PLATFORM} 
set(extra_args -make libs -make tools -fast -no-separate-debug-info ${qt_flags} ${extra_qt_flags})

if(VISIT_STATIC)
    set(extra_args --static)
endif()

set(qt_cflags ${CMAKE_C_FLAGS})
set(qt_cxxflags ${CMAKE_CXX_FLAGS})

ExternalProject_Add(qt
  SOURCE_DIR ${qt_source}
  BINARY_DIR ${qt_binary}
  INSTALL_DIR ${qt_install}
  URL ${qt_url}
  URL_MD5 ${qt_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND echo "o" | CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} CFLAGS=${qt_cflags} CXXFLAGS=${qt_cxxflags} ./configure --prefix=${qt_install}  ${extra_args}
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
