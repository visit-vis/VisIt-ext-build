register_module(visit)

set(visit_name "visit")
set(visit_version 2.9.1)
set(visit_file "visit${visit_version}.tar.gz")
set(visit_compatibility_version 2.0)
set(visit_build_dir "visit-${visit_version}")
set(visit_md5 "9cc9125a58b905a4148e4e2fda3fabc6")

set(visit_deps python vtk qt silo hdf5 netcdf)

set(visit_source ${CMAKE_BINARY_DIR}/${visit_build_dir})
set(visit_binary ${CMAKE_BINARY_DIR}/${visit_build_dir})
set(visit_install ${CMAKE_INSTALL_PREFIX}/${visit_name})

#set(visit_url "${nersc_tp_url}/${visit_file}")
#set(visit_url "http://portal.nersc.gov/project/visit/releases/${visit_version}/${visit_file}")
set(visit_url "http://portal.nersc.gov/svn/visit/tags/${visit_version}/src")

message("${visit_url}")

