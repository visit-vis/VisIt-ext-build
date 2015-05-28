add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_DIR \"${hdf5_install}\")")

if(WIN32)
  add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(HDF5_AFFIX_LIBNAMES_DLL OFF)")
endif()

if(NOT WIN32)
  #add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP \"${szip_install}/lib\" sz /usr/lib/x86_64-linux-gnu z TYPE STRING)")
  add_hostconfig(hdf5 "VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP \"${szip_install}/lib\" sz ${zlib_install} TYPE STRING)")
endif()

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--disable-shared --enable-static")
#else()
#    set(extra_args "--enable-shared --disable-static")
endif()

if(WIN32)
  ExternalProject_Add(hdf5
    SOURCE_DIR ${hdf5_source}
    BINARY_DIR ${hdf5_binary}
    INSTALL_DIR ${hdf5_install}
    URL ${hdf5_url}
    URL_MD5 ${hdf5_md5}
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/HDF5CMake.txt <BINARY_DIR>/CMakeLists.txt 
    #CONFIGURE_COMMAND 
    CMAKE_ARGS -DZLIB_FOUND:BOOL=ON -DSZIP_FOUND:BOOL=ON -DZLIB_LIBRARIES=${zlib_install}/lib/zlib.lib -DSZIP_LIBRARIES=${szip_install}/lib/szip.lib -DZLIB_DIR:PATH=${zlib_install} -DZLIB_USE_EXTERNAL:BOOL=ON -DZLIB_LIBRARY:FILEPATH=${zlib_install}/lib/zlib.lib -DZLIB_INCLUDE_DIR:PATH=${zlib_install}/include -DSZIP_DIR:PATH=${szip_install} -DSZIP_USE_EXTERNAL:BOOL=ON -DSZIP_LIBRARY:FILEPATH=${szip_install}/lib/szip.lib -DSZIP_INCLUDE_DIR:PATH=${szip_install}/include -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON -DHDF5_ENABLE_SZIP_SUPPORT:BOOL=ON -DHDF5_BUILD_FORTRAN:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON -DHDF5_BUILD_CPP_LIB:BOOL=ON -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    #BUILD_COMMAND 
    #INSTALL_COMMAND 
    #${ep_log_options}
    )
else()
  ExternalProject_Add(hdf5
    SOURCE_DIR ${hdf5_source}
    BINARY_DIR ${hdf5_binary}
    INSTALL_DIR ${hdf5_install}
    URL ${hdf5_url}
    URL_MD5 ${hdf5_md5}
    #PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/HDF5CMake.txt <BINARY_DIR>/CMakeLists.txt 
    CONFIGURE_COMMAND ./${hdf5_build_dir}/configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} --prefix=${hdf5_install} --with-szlib=${szip_install} ${extra_args}
    #CMAKE_ARGS -DZLIB_FOUND:BOOL=ON -DSZIP_FOUND:BOOL=ON -DZLIB_LIBRARIES=${zlib_install}/lib/zlib.so -DSZIP_LIBRARIES=${szip_install}/lib/szip.so -DZLIB_DIR:PATH=${zlib_install} -DZLIB_USE_EXTERNAL:BOOL=ON -DZLIB_LIBRARY:FILEPATH=${zlib_install}/lib/zlib.lib -DZLIB_INCLUDE_DIR:PATH=${zlib_install}/include -DSZIP_DIR:PATH=${szip_install} -DSZIP_USE_EXTERNAL:BOOL=ON -DSZIP_LIBRARY:FILEPATH=${szip_install}/lib/szip.lib -DSZIP_INCLUDE_DIR:PATH=${szip_install}/include -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON -DHDF5_ENABLE_SZIP_SUPPORT:BOOL=ON -DHDF5_BUILD_FORTRAN:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON -DHDF5_BUILD_CPP_LIB:BOOL=ON -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    #BUILD_COMMAND $(MAKE) 
    #INSTALL_COMMAND $(MAKE) install
    )
endif()
