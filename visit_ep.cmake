
#if(WIN32 AND ${VISIT_BUILD_TYPE} MATCHES "Debug")
#add_hostconfig(visit "ADD_DEFINITIONS(/DEBUG)")
#add_hostconfig(visit "ADD_DEFINITIONS(/DEBUG /D \\\"_DEBUG\\\")")
#endif()

if(VISIT_RELEASE_PACKAGE)
ExternalProject_Add(visit
  SOURCE_DIR ${visit_source}
  BINARY_DIR ${visit_binary}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  SVN_REPOSITORY ${visit_url}
  CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DVISIT_CONFIG_SITE=${hostconfig}
  PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/FindHDF5.cmake ${visit_source}/CMake/FindHDF5.cmake
  INSTALL_COMMAND make package
  )
else()
ExternalProject_Add(visit
  SOURCE_DIR ${visit_source}
  BINARY_DIR ${visit_binary}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  SVN_REPOSITORY ${visit_url}
  CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=${VISIT_RELEASE_DIR} -DVISIT_CONFIG_SITE=${hostconfig}
  PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/FindHDF5.cmake ${visit_source}/CMake/FindHDF5.cmake
  )
endif()
