register_module(boxlib)

set(boxlib_name "boxlib")
set(boxlib_version 1.1.6)
set(boxlib_file "ccse-${boxlib_version}.tar.gz")
set(boxlib_compatibility_version ${boxlib_version})
set(boxlib_build_dir "ccse-${boxlib_version}")
set(boxlib_md5 "d41d8cd98f00b204e9800998ecf8427e")

set(boxlib_deps "")

set(boxlib_source ${CMAKE_BINARY_DIR}/${boxlib_build_dir})
set(boxlib_binary ${CMAKE_BINARY_DIR}/${boxlib_build_dir})
set(boxlib_install ${CMAKE_INSTALL_PREFIX}/${boxlib_name}/${boxlib_version}/${visit_arch})

set(boxlib_url "https://ccse.lbl.gov/Software/tarfiles/${boxlib_file}")

message("${boxlib_url}")


