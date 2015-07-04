add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_DIR \"${hdf5_install}\")")

if(WIN32)
  add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(HDF5_LIBNAMES_AFFIX_DLL OFF)")
  if(${VISIT_BUILD_TYPE} MATCHES "Debug")
    add_hostconfig(hdf5 "SET(HDF5_LIB_NAME hdf5_d hdf5_hl_d)")
  else()
    add_hostconfig(hdf5 "SET(HDF5_LIB_NAME hdf5 hdf5_hl)")
  endif()
endif()

if(NOT WIN32)
  #add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP \"${szip_install}/lib\" sz /usr/lib/x86_64-linux-gnu z TYPE STRING)")
  add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP \"${szip_install}/lib\" sz \"${zlib_install}/lib\" z TYPE STRING)")
endif()

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--disable-shared --enable-static")
#else()
#    set(extra_args "--enable-shared --disable-static")
endif()

configure_file(${CMAKE_SOURCE_DIR}/HDF5CMake.txt.in ${CMAKE_BINARY_DIR}/HDF5CMakeLists.txt)

if(WIN32)
  ExternalProject_Add(hdf5
    SOURCE_DIR ${hdf5_source}
    BINARY_DIR ${hdf5_binary}
    INSTALL_DIR ${hdf5_install}
    URL ${hdf5_url}
    URL_MD5 ${hdf5_md5}
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/HDF5CMakeLists.txt <BINARY_DIR>/CMakeLists.txt 
    CMAKE_ARGS -DZLIB_FOUND:BOOL=ON -DSZIP_FOUND:BOOL=ON -DZLIB_LIBRARIES=${zlib_library} -DSZIP_LIBRARIES=${szip_library} -DZLIB_DIR:PATH=${zlib_install} -DZLIB_USE_EXTERNAL:BOOL=ON -DZLIB_LIBRARY:FILEPATH=${zlib_library} -DZLIB_INCLUDE_DIR:PATH=${zlib_install}/include -DSZIP_DIR:PATH=${szip_install} -DSZIP_USE_EXTERNAL:BOOL=ON -DSZIP_LIBRARY:FILEPATH=${szip_library} -DSZIP_INCLUDE_DIR:PATH=${szip_install}/include -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON -DHDF5_ENABLE_SZIP_SUPPORT:BOOL=ON -DHDF5_BUILD_FORTRAN:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON -DHDF5_BUILD_CPP_LIB:BOOL=ON -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    )
else()
  ExternalProject_Add(hdf5
    SOURCE_DIR ${hdf5_source}
    BINARY_DIR ${hdf5_binary}
    INSTALL_DIR ${hdf5_install}
    URL ${hdf5_url}
    URL_MD5 ${hdf5_md5}
    CONFIGURE_COMMAND ./${hdf5_build_dir}/configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} --prefix=${hdf5_install} --with-szlib=${szip_install} ${extra_args}
    )
endif()
