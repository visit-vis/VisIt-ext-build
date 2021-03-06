add_hostconfig(netcdf "VISIT_OPTION_DEFAULT(VISIT_NETCDF_DIR \"${netcdf_install}\")")

if(NOT WIN32)
  add_hostconfig(netcdf "VISIT_OPTION_DEFAULT(VISIT_NETCDF_LIBDEP HDF5_LIBRARY_DIR hdf5 \\\${VISIT_HDF5_LIBDEP} TYPE STRING)")
endif()

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--disable-shared --enable-static")
#else()
#    set(extra_args "--enable-shared --disable-static")
endif()

if(WIN32)
  ExternalProject_Add(netcdf
    SOURCE_DIR ${netcdf_source}
    BINARY_DIR ${netcdf_binary}
    INSTALL_DIR ${netcdf_install}
    URL ${netcdf_url}
    URL_MD5 ${netcdf_md5}
    CMAKE_ARGS -DBUILD_SHARED_LIBS:BOOL=ON -DENABLE_DAP:BOOL=OFF -DZLIB_DIR=${zlib_install} -DZLIB_INCLUDE_DIR=${zlib_install}/include -DZLIB_LIBRARY=${zlib_library} -DZLIB_LIBRARIES=${zlib_library} -DHDF5_DIR:PATH=${hdf5_install}/cmake -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    )
else()
  ExternalProject_Add(netcdf
    SOURCE_DIR ${netcdf_source}
    BINARY_DIR ${netcdf_binary}
    INSTALL_DIR ${netcdf_install}
    URL ${netcdf_url}
    URL_MD5 ${netcdf_md5}
    CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} CFLAGS=-I${hdf5_install}/include LDFLAGS=-L${hdf5_install}/lib --prefix=${netcdf_install} --enable-netcdf-4 ${extra_args}
    )
endif()
