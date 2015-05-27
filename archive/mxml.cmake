register_module(mxml)

set(mxml_name "mxml")
set(mxml_version 2.6)
set(mxml_file "mxml-${mxml_version}.tar.gz")
set(mxml_compatibility_version ${mxml_version})
set(mxml_build_dir "mxml-${mxml_version}")
set(mxml_md5 "68977789ae64985dddbd1a1a1652642e")

set(mxml_deps "")

set(mxml_source ${CMAKE_BINARY_DIR}/${mxml_build_dir})
set(mxml_binary ${CMAKE_BINARY_DIR}/${mxml_build_dir})
set(mxml_install ${CMAKE_INSTALL_PREFIX}/${mxml_name}/${mxml_version}/${visit_arch})

set(mxml_url ${nersc_tp_url}/${mxml_file})

message("${mxml_url}")

