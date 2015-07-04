#add_hostconfig(netcdf "VISIT_OPTION_DEFAULT(VISIT_NETCDF_DIR \"${netcdf_install}\")")

#if(NOT WIN32)
#  add_hostconfig(netcdf "VISIT_OPTION_DEFAULT(VISIT_NETCDF_LIBDEP HDF5_LIBRARY_DIR hdf5 \\\${VISIT_HDF5_LIBDEP} TYPE STRING)")
#endif()

set(extra_args "")

if(VISIT_STATIC)
    set(extra_args "--disable-shared --enable-static")
#else()
#    set(extra_args "--enable-shared --disable-static")
endif()

if(WIN32)
  ExternalProject_Add(netcdf_cxx
    SOURCE_DIR ${netcdf_cxx_source}
    BINARY_DIR ${netcdf_cxx_binary}
    INSTALL_DIR ${netcdf_install} #installs to netcdf location..
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/NETCDFCXXCMake.txt.in <SOURCE_DIR>/CMakeLists.txt && ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/config.h.in <SOURCE_DIR>/config.h
    URL ${netcdf_cxx_url_c}
    #URL_MD5 ${netcdf_cxx_md5}
    CMAKE_ARGS -DNetCDF_INCLUDE_DIR=${netcdf_install}/include -DNetCDF_LIBRARY_DIR=${netcdf_install}/lib -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    )
else()
  ExternalProject_Add(netcdf_cxx
    SOURCE_DIR ${netcdf_cxx_source}/c4
    BINARY_DIR ${netcdf_cxx_binary}/c4
    INSTALL_DIR ${netcdf_install} #installs to netcdf location..
    URL ${netcdf_cxx_url_c}
    #URL_MD5 ${netcdf_cxx_md5}
    CONFIGURE_COMMAND ./configure CXX=${CMAKE_CXX_COMPILER} CC=${CMAKE_C_COMPILER} CPPFLAGS=-I${netcdf_install}/include CFLAGS=-I${netcdf_install}/include LDFLAGS=-L${netcdf_install}/lib --prefix=${netcdf_install} ${extra_args}
    )
endif()
