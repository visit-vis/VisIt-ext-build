register_module(silo)

set(silo_name "silo")
set(silo_version 4.10.2)
set(silo_file "silo-${silo_version}.tar.gz")
set(silo_compatibility_version 4.10)
set(silo_build_dir "silo-${silo_version}")
#set(silo_md5 "aea6992437e1ed75cddcec1d91c6ff36")

set(silo_deps szip zlib hdf5)

set(silo_source ${CMAKE_BINARY_DIR}/${silo_build_dir})
set(silo_binary ${CMAKE_BINARY_DIR}/${silo_build_dir})
set(silo_install ${CMAKE_INSTALL_PREFIX}/${silo_name}/${silo_version}/${visit_arch})

#if(WIN32)
set(silo_url "https://wci.llnl.gov/content/assets/docs/simulation/computer-codes/silo/silo-4.10.2/silo-4.10.2.tar.gz")
#else()
#set(silo_url "https://wci.llnl.gov/codes/silo/silo-${silo_version}/${silo_file}")
#endif()

message("${silo_url}")

