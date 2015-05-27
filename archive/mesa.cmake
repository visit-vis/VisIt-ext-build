register_module(mesa)

set(mesa_name "mesa")
set(mesa_version 7.8.2)
set(mesa_file "MesaLib-${mesa_version}.tar.gz")
set(mesa_compatibility_version 7.8)
set(mesa_build_dir "mesa-${mesa_version}")
set(mesa_md5 "c89b63d253605ed40e8ac370d25a833c")

set(mesa_deps "")

set(mesa_source ${CMAKE_BINARY_DIR}/${mesa_build_dir})
set(mesa_binary ${CMAKE_BINARY_DIR}/${mesa_build_dir})
set(mesa_install ${CMAKE_INSTALL_PREFIX}/${mesa_name}/${mesa_version}/${visit_arch})

set(mesa_url "${nersc_tp_url}/${mesa_file}")

message("${mesa_url}")
