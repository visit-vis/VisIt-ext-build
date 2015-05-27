add_hostconfig(python "VISIT_OPTION_DEFAULT(VISIT_PYTHON_DIR \"${python_install}\")")

set(extra_args "")

if(NOT VISIT_STATIC)
    set(extra_args "${extra_args} --enable-shared")
endif()



set(cflags "-fPIC ${CMAKE_C_FLAGS}")
set(cxxflags "-fPIC ${CMAKE_CXX_FLAGS}")

if(WIN32)

#TODO: type..
set(PYTHON_MACHINE_PATH "PCbuild/amd64")

set(PYTHON_BUILD_TYPE "Debug")
set(PYTHON_INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python27_d.dll <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python27_d.lib <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python_d.exe <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/kill_python_d.exe <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy_directory Lib <INSTALL_DIR>/Lib && ${CMAKE_COMMAND} -E copy_directory Include <INSTALL_DIR>/Include && ${CMAKE_COMMAND} -E copy PC/pyconfig.h <INSTALL_DIR>/Include/pyconfig.h && ${CMAKE_COMMAND} -E make_directory <INSTALL_DIR>/Libs/ && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python27_d.lib <INSTALL_DIR>/Libs/)

if(${CMAKE_BUILD_TYPE} MATCHES "Release")
  set(PYTHON_BUILD_TYPE "Release")
  set(PYTHON_INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python27.dll <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python27.lib <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python.exe <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/kill_python.exe <INSTALL_DIR> && ${CMAKE_COMMAND} -E copy_directory Lib <INSTALL_DIR>/Lib && ${CMAKE_COMMAND} -E copy_directory Include <INSTALL_DIR>/Include && ${CMAKE_COMMAND} -E copy PC/pyconfig.h <INSTALL_DIR>/Include/pyconfig.h && ${CMAKE_COMMAND} -E make_directory <INSTALL_DIR>/Libs/ && ${CMAKE_COMMAND} -E copy ${PYTHON_MACHINE_PATH}/python27.lib <INSTALL_DIR>/Libs/)
endif()

set(PYTHON_BUILD_TYPE "${PYTHON_BUILD_TYPE}|x64")

ExternalProject_Add(python
  SOURCE_DIR ${python_source}
  BINARY_DIR ${python_binary}
  INSTALL_DIR ${python_install}
  URL ${python_url}
  URL_MD5 ${python_md5}
  PATCH_COMMAND devenv PCbuild/pcbuild.sln /upgrade
  CONFIGURE_COMMAND "" 
  BUILD_COMMAND devenv PCbuild/pcbuild.sln /build ${PYTHON_BUILD_TYPE} /project python /projectconfig ${PYTHON_BUILD_TYPE}
  INSTALL_COMMAND ${PYTHON_INSTALL_COMMAND}
  )
else()
ExternalProject_Add(python
  SOURCE_DIR ${python_source}
  BINARY_DIR ${python_binary}
  INSTALL_DIR ${python_install}
  URL ${python_url}
  URL_MD5 ${python_md5}
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./configure OPT=${CMAKE_C_FLAGS} LDFLAGS=${CMAKE_EXE_LINKER_FLAGS} CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} CFLAGS=${cflags} CXXFLAGS=${cxxflags} --prefix=${python_install} ${extra_args} --disable-ipv6 --enable-shared
  BUILD_COMMAND $(MAKE)
  INSTALL_COMMAND $(MAKE) -j1 install
  #${ep_log_options}
  )
  endif()
