register_module(hdf5)

set(hdf5_name "hdf5")
set(hdf5_version 1.8.15)
if(WIN32)
set(hdf5_file "hdf5-${hdf5_version}-CMake.zip")
else()
set(hdf5_file "hdf5-${hdf5_version}-CMake.tar.gz")
endif()
set(hdf5_compatibility_version 1.8)
set(hdf5_build_dir "hdf5-${hdf5_version}")
#set(hdf5_md5 "37711d4bcb72997e93d495f97c76c33a")

set(hdf5_deps zlib szip)

set(hdf5_source ${CMAKE_BINARY_DIR}/${hdf5_build_dir})
set(hdf5_binary ${CMAKE_BINARY_DIR}/${hdf5_build_dir})
set(hdf5_install ${CMAKE_INSTALL_PREFIX}/${hdf5_name}/${hdf5_version}/${visit_arch})

set(hdf5_url "http://www.hdfgroup.org/ftp/HDF5/current/src/CMake/${hdf5_file}")


message("${hdf5_url}")

