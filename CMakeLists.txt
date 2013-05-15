cmake_minimum_required(VERSION 2.8)

IF (COMMAND cmake_policy)
    cmake_policy(SET CMP0003 NEW)
ENDIF (COMMAND cmake_policy)

#if("${CMAKE_INSTALL_PREFIX}" STREQUAL "/usr/local")
#  set(CMAKE_INSTALL_PREFIX ${cdat_ROOT_DIR}/install CACHE STRING "" FORCE)
#endif()

set(CMAKE_MODULE_PATH
  ${CMAKE_SOURCE_DIR}
  ${CMAKE_BINARY_DIR}
  ${CMAKE_MODULE_PATH}
)

set(visit_version "trunk")  # or a number for the appropriate tag..
set(visit_arch "${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
string(TOLOWER ${visit_arch} visit_arch)

set(nersc_base_url "http://portal.nersc.gov/svn/visit")
set(nersc_tag_url "http://portal.nersc.gov/svn/visit/tags")
set(nersc_trunk_url "http://portal.nersc.gov/svn/visit/trunk")

set(nersc_tp_url "http://portal.nersc.gov/svn/visit/trunk/third_party/")

site_name(hostconfig)
set(hostconfig "${CMAKE_INSTALL_PREFIX}/${hostconfig}.cmake")

#set(ENV{PATH} "${CMAKE_INSTALL_PREFIX}/bin:$ENV{PATH}")

find_program(WGET wget)
#set(MAKE make)

include(ExternalProject)

set(module_list)

macro(register_module module)
    list(APPEND module_list ${module})
endmacro()

macro(add_hostconfig module config)
  #message("creating hostconfig for: ${module}")

  if(${module}_map)
    set(${module}_map "${${module}_map}\n${config}")
  else()
    set(${module}_map ${config})
  endif()

  #message("map: ${${module}_map}")
endmacro()

#add packages..
include(adios)
include(advio)
include(boxlib)
include(hdf5)
include(mesa)
include(mxml)
include(python)
include(qt)
include(silo)
include(szip)
include(zlib)
include(vtk)

#include the external project files..
#todo: recursively include these in dependency order..
foreach(module ${module_list})
    include("${module}_ep")
endforeach()

foreach(module ${module_list})
    #message("Configuring module ${module} with ${${module}_deps}")
    
    if("${${module}_deps}" STREQUAL "")
        message("Skipping dependency check for ${module}")
    else()
        add_dependencies(${module} ${${module}_deps})
    endif()
endforeach()


file(WRITE "${hostconfig}" "\#cmake file\n")

file(APPEND "${hostconfig}" "VISIT_OPTION_DEFAULT(VISIT_C_COMPILER ${CMAKE_C_COMPILER} TYPE FILEPATH)\n")
file(APPEND "${hostconfig}" "VISIT_OPTION_DEFAULT(VISIT_CXX_COMPILER ${CMAKE_CXX_COMPILER} TYPE FILEPATH)\n")
file(APPEND "${hostconfig}" "VISIT_OPTION_DEFAULT(VISIT_C_FLAGS \"${CMAKE_C_FLAGS} -m64 -fPIC -fvisibility=hidden\" TYPE STRING)\n")
file(APPEND "${hostconfig}" "VISIT_OPTION_DEFAULT(VISIT_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -m64 -fPIC -fvisibility=hidden\" TYPE STRING)\n\n")

message(${hostconfig})
foreach(module ${module_list})
    if(${module}_map)
        file(APPEND "${hostconfig}" "\#config for ${module}\n")    
        file(APPEND "${hostconfig}" "${${module}_map}\n\n")
    endif()

endforeach()

