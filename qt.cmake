register_module(qt)

set(qt_name "qt")
set(qt_version 4.8.3)
set(qt_file "qt-everywhere-opensource-src-${qt_version}.tar.gz")
set(qt_compatibility_version 4.8)
set(qt_build_dir "qt-${qt_version}")
set(qt_md5 "a663b6c875f8d7caa8ac9c30e4a4ec3b")

set(qt_deps "")

set(qt_source ${CMAKE_BINARY_DIR}/${qt_build_dir})
set(qt_binary ${CMAKE_BINARY_DIR}/${qt_build_dir})
set(qt_install ${CMAKE_INSTALL_PREFIX}/${qt_name}/${qt_version}/${visit_arch})

set(qt_url "${nersc_tp_url}/${qt_file}")

message("${qt_url}")

