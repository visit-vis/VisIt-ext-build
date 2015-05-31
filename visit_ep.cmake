if(VISIT_RELEASE_PACKAGE)
ExternalProject_Add(visit
  SOURCE_DIR ${visit_source}
  BINARY_DIR ${visit_binary}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  URL ${visit_url}
  CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DVISIT_CONFIG_SITE=${hostconfig}
  PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/VisItCMake.txt ${visit_source}/CMakeLists.txt
  INSTALL_COMMAND make package
  )
else()
ExternalProject_Add(visit
  SOURCE_DIR ${visit_source}
  BINARY_DIR ${visit_binary}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  URL ${visit_url}
  CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DCMAKE_INSTALL_PREFIX=${VISIT_RELEASE_DIR} -DVISIT_CONFIG_SITE=${hostconfig}
  PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/VisItCMake.txt ${visit_source}/CMakeLists.txt
  )
endif()
