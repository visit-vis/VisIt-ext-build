register_module(netcdf)

set(netcdf_name "netcdf")
set(netcdf_version 4.3.3.1)
set(netcdf_file "netcdf-c-${netcdf_version}.zip")
set(netcdf_compatibility_version 4.3)
set(netcdf_build_dir "netcdf-${netcdf_version}")
#set(netcdf_md5 "37711d4bcb72997e93d495f97c76c33a")

set(netcdf_deps zlib hdf5)

set(netcdf_source ${CMAKE_BINARY_DIR}/${netcdf_build_dir})
set(netcdf_binary ${CMAKE_BINARY_DIR}/${netcdf_build_dir})
set(netcdf_install ${CMAKE_INSTALL_PREFIX}/${netcdf_name}/${netcdf_version}/${visit_arch})

set(netcdf_url "https://github.com/Unidata/netcdf-c/archive/v4.3.3.1.zip")

message("${netcdf_url}")
