register_module(zlib)

set(zlib_name "zlib")
set(zlib_version 1.2.7)
set(zlib_file "zlib-${zlib_version}.tar.gz")
set(zlib_compatibility_version 1.2)
set(zlib_build_dir "zlib-${zlib_version}")
#set(zlib_md5 "60df6a37c56e7c1366cca812414f7b85")

set(zlib_deps "")

set(zlib_source ${CMAKE_BINARY_DIR}/${zlib_build_dir})
set(zlib_binary ${CMAKE_BINARY_DIR}/${zlib_build_dir})
set(zlib_install ${CMAKE_INSTALL_PREFIX}/${zlib_name}/${zlib_version}/${visit_arch})

if(NOT WIN32)
  set(zlib_url "${nersc_tp_url}/${zlib_file}")
else()
  set(zlib_url "http://www.hdfgroup.org/ftp/HDF5/current/src/CMake/CMake-files/ZLib.tar.gz")
endif()

message("${zlib_url}")

