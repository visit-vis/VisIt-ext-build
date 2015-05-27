register_module(silo)

set(silo_name "silo")
set(silo_version 4.9.1)
set(silo_file "silo-${silo_version}.tar.gz")
set(silo_compatibility_version 4.9)
set(silo_build_dir "silo-${silo_version}")
set(silo_md5 "aea6992437e1ed75cddcec1d91c6ff36")

set(silo_deps hdf5 szip zlib)

set(silo_source ${CMAKE_BINARY_DIR}/${silo_build_dir})
set(silo_binary ${CMAKE_BINARY_DIR}/${silo_build_dir})
set(silo_install ${CMAKE_INSTALL_PREFIX}/${silo_name}/${silo_version}/${visit_arch})

set(silo_url "https://wci.llnl.gov/codes/silo/silo-${silo_version}/${silo_file}")

message("${silo_url}")

