register_module(visit)

set(visit_name "visit")
set(visit_version 2.7.0)
set(visit_file "visit-${visit_version}.tar.gz")
set(visit_compatibility_version 2.0)
set(visit_build_dir "visit-${visit_version}")
set(visit_md5 "9cc9125a58b905a4148e4e2fda3fabc6")

set(visit_deps "")

set(visit_source ${CMAKE_BINARY_DIR}/${visit_build_dir})
set(visit_binary ${CMAKE_BINARY_DIR}/${visit_build_dir})
set(visit_install ${CMAKE_INSTALL_PREFIX}/${visit_name}/${visit_version}/${visit_arch})

set(visit_url "${nersc_tp_url}/${visit_file}")

message("${visit_url}")

