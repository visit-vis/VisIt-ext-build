register_module(advio)

set(advio_name "advio")
set(advio_version 1.2)
set(advio_file "AdvIO-${advio_version}.tar.gz")
set(advio_compatibility_version ${advio_version})
set(advio_build_dir "advio-${advio_version}")
set(advio_md5 "db6def939a2d5dd4d3d6203ba5d3ec7e")

set(advio_deps "")

set(advio_source ${CMAKE_BINARY_DIR}/${advio_build_dir})
set(advio_binary ${CMAKE_BINARY_DIR}/${advio_build_dir})
set(advio_install ${CMAKE_INSTALL_PREFIX}/${advio_name}/${advio_version}/${visit_arch})

set(advio_url "${nersc_tp_url}/${advio_file}")

message("${advio_url}")

