register_module(szip)

set(szip_name "szip")
set(szip_version 2.1)
set(szip_file "szip-${szip_version}.tar.gz")
set(szip_compatibility_version 2.0)
set(szip_build_dir "szip-${szip_version}")
#set(szip_md5 "9cc9125a58b905a4148e4e2fda3fabc6")

set(szip_deps "")

set(szip_source ${CMAKE_BINARY_DIR}/${szip_build_dir})
set(szip_binary ${CMAKE_BINARY_DIR}/${szip_build_dir})
set(szip_install ${CMAKE_INSTALL_PREFIX}/${szip_name}/${szip_version}/${visit_arch})

set(szip_library ${szip_install}/lib/szip.so)

if(WIN32)
  if(${VISIT_BUILD_TYPE} MATCHES "Release")
    set(szip_library ${szip_install}/lib/szip.lib)
  else()
    set(szip_library ${szip_install}/lib/szip_D.lib)
  endif()
endif()

if(NOT WIN32)
set(szip_url "${nersc_tp_url}/${szip_file}")
else()
set(szip_url "http://www.hdfgroup.org/ftp/HDF5/current/src/CMake/CMake-files/SZip.tar.gz")
endif()

message("${szip_url}")

