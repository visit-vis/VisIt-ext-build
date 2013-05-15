register_module(vtk)

set(vtk_name "vtk")
set(vtk_version 6.0.0)
set(vtk_file "VTK-12fca6b.tar.gz")
set(vtk_compatibility_version 6.0)
set(vtk_build_dir "vtk-${vtk_version}")
set(vtk_md5 "63d546d95a42e7dc6c2883e02fab7392")

set(vtk_deps hdf5 mesa python zlib qt)

set(vtk_source ${CMAKE_BINARY_DIR}/${vtk_build_dir})
set(vtk_binary ${CMAKE_BINARY_DIR}/${vtk_build_dir})
set(vtk_install ${CMAKE_INSTALL_PREFIX}/${vtk_name}/${vtk_version}/${visit_arch})

set(vtk_url "${nersc_tp_url}/${vtk_file}")

message("${vtk_url}")

#todo handle zlib?

