register_module(adios)

set(adios_name "adios")
set(adios_version 1.3)
set(adios_file "adios-${adios_version}.tar.gz")
set(adios_compatibility_version ${adios_version})
set(adios_build_dir "adios-${adios_version}")
set(adios_md5 "5eb937491eac015966dc6c6146fe5876")

set(adios_deps mxml)

set(adios_source ${CMAKE_BINARY_DIR}/${adios_build_dir})
set(adios_binary ${CMAKE_BINARY_DIR}/${adios_build_dir})
set(adios_install ${CMAKE_INSTALL_PREFIX}/${adios_name}/${adios_version}/${visit_arch})

set(adios_url "${nersc_tp_url}/${adios_file}")

message("${adios_url}")


