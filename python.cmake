register_module(python)

set(python_name "python")
set(python_version 2.7.6)
set(python_file "Python-${python_version}.tgz")
set(python_compatibility_version 2.7)
set(python_build_dir "python-${python_version}")
#set(python_md5 "17dcac33e4f3adb69a57c2607b6de246")

set(python_deps "")

set(python_source ${CMAKE_BINARY_DIR}/${python_build_dir})
set(python_binary ${CMAKE_BINARY_DIR}/${python_build_dir})
set(python_install ${CMAKE_INSTALL_PREFIX}/${python_name}/${python_version}/${visit_arch})

if(WIN32)
  if(${VISIT_BUILD_TYPE} MATCHES "Release")
    set(python_executable ${python_install}/python)
    set(python_library ${python_install}/python27.lib)
    set(python_debug_library ${python_install}/python27.lib)
  else()
    set(python_executable ${python_install}/python_d)
    set(python_library ${python_install}/python27_d.lib)
    set(python_debug_library ${python_install}/python27_d.lib)
  endif()

  set(python_include_dir ${python_install}/Include)
elseif(APPLE)
  set(python_executable ${python_install}/bin/python)
  set(python_library ${python_install}/lib/libpython${python_compatibility_version}.dylib)
  set(python_include_dir ${python_install}/include/python${python_compatibility_version})
else()
  set(python_executable ${python_install}/bin/python)
  set(python_library ${python_install}/lib/libpython${python_compatibility_version}.so)
  set(python_include_dir ${python_install}/include/python${python_compatibility_version})
endif()

set(python_url "${nersc_tp_url}/${python_file}")

message("${python_url}")

set(ENV{LD_LIBRARY_PATH} "${python_install}/lib:$ENV{LD_LIBRARY_PATH}" )

message($ENV{LD_LIBRARY_PATH})

