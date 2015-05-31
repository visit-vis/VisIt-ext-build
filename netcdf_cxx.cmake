register_module(netcdf_cxx)

set(netcdf_cxx_name "netcdf_cxx")
set(netcdf_cxx_version 4.4.2)
set(netcdf_cxx_file "netcdf-c-${netcdf_version}.zip")
set(netcdf_cxx_compatibility_version 4.4)
set(netcdf_cxx_build_dir "netcdf_cxx-${netcdf_cxx_version}")
#set(netcdf_cxx_md5 "37711d4bcb72997e93d495f97c76c33a")

set(netcdf_cxx_deps netcdf)

set(netcdf_cxx_source ${CMAKE_BINARY_DIR}/${netcdf_cxx_build_dir})
set(netcdf_cxx_binary ${CMAKE_BINARY_DIR}/${netcdf_cxx_build_dir})

set(netcdf_cxx_url "http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx4-4.2.tar.gz")

set(netcdf_cxx_url_c "http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx-4.2.tar.gz")


