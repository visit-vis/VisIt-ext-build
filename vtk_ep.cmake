add_hostconfig(vtk "VISIT_OPTION_DEFAULT(VISIT_VTK_DIR ${vtk_install})")

set(vopts "")

if(VISIT_STATIC)
    set(vopts ${vopts} -DBUILD_SHARED_LIBS:BOOL=OFF)
else()
    set(vopts ${vopts} -DBUILD_SHARED_LIBS:BOOL=ON)
endif()

set(vopts ${vopts} -DCMAKE_BUILD_TYPE:STRING=Release)
set(vopts ${vopts} -DCMAKE_INSTALL_PREFIX:PATH=${vtk_install})

set(vtk_debug_leaks False)

set(vopts ${vopts} -DVTK_DEBUG_LEAKS:BOOL=${vtk_debug_leaks})
set(vopts ${vopts} -DBUILD_TESTING:BOOL=false)
set(vopts ${vopts} -DBUILD_DOCUMENTATION:BOOL=false)
set(vopts ${vopts} -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER})
set(vopts ${vopts} -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER})
set(vopts ${vopts} -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS})
set(vopts ${vopts} -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS})
#set(vopts ${vopts} -DCMAKE_EXE_LINKER_FLAGS:STRING=${lf})
#set(vopts ${vopts} -DCMAKE_MODULE_LINKER_FLAGS:STRING=${lf})
#set(vopts ${vopts} -DCMAKE_SHARED_LINKER_FLAGS:STRING=${lf})

set(vopts ${vopts} -DVTK_ALL_NEW_OBJECT_FACTORY:BOOL=true)

# Turn off module groups
set(vopts ${vopts} -DVTK_Group_Imaging:BOOL=false)
set(vopts ${vopts} -DVTK_Group_MPI:BOOL=false)
set(vopts ${vopts} -DVTK_Group_Qt:BOOL=false)
set(vopts ${vopts} -DVTK_Group_Rendering:BOOL=false)
set(vopts ${vopts} -DVTK_Group_StandAlone:BOOL=false)
set(vopts ${vopts} -DVTK_Group_Tk:BOOL=false)
set(vopts ${vopts} -DVTK_Group_Views:BOOL=false)

set(vopts ${vopts} -DModule_vtkCommonCore:BOOL=true)
set(vopts ${vopts} -DModule_vtkFiltersFlowPaths:BOOL=true)
set(vopts ${vopts} -DModule_vtkFiltersHybrid:BOOL=true)
set(vopts ${vopts} -DModule_vtkFiltersModeling:BOOL=true)
set(vopts ${vopts} -DModule_vtkGeovisCore:BOOL=true)
set(vopts ${vopts} -DModule_vtkIOEnSight:BOOL=true)
set(vopts ${vopts} -DModule_vtkIOGeometry:BOOL=true)
set(vopts ${vopts} -DModule_vtkIOLegacy:BOOL=true)
set(vopts ${vopts} -DModule_vtkIOPLY:BOOL=true)
set(vopts ${vopts} -DModule_vtkIOXML:BOOL=true)
set(vopts ${vopts} -DModule_vtkInteractionStyle:BOOL=true)
set(vopts ${vopts} -DModule_vtkRenderingAnnotation:BOOL=true)
set(vopts ${vopts} -DModule_vtkRenderingFreeType:BOOL=true)
set(vopts ${vopts} -DModule_vtkRenderingFreeTypeOpenGL:BOOL=true)
set(vopts ${vopts} -DModule_vtkRenderingOpenGL:BOOL=true)
set(vopts ${vopts} -DModule_vtklibxml2:BOOL=true)

#gui support..
set(vopts ${vopts} -DModule_vtkGUISupportQtOpenGL:BOOL=true)
set(vopts ${vopts} -DQT_QMAKE_EXECUTABLE:FILEPATH=${qt_install}/bin/qmake)

#python support
set(vopts ${vopts} -DVTK_WRAP_PYTHON:BOOL=true)
set(vopts ${vopts} -DPYTHON_EXECUTABLE:FILEPATH=${python_executable})
set(vopts ${vopts} -DPYTHON_EXTRA_LIBS:STRING=${VTK_PY_LIBS})
set(vopts ${vopts} -DPYTHON_INCLUDE_DIR:PATH=${python_include_dir})
set(vopts ${vopts} -DPYTHON_LIBRARY:FILEPATH=${python_library})

#R support
#set(vopts ${vopts} -DModule_vtkFiltersStatisticsGnuR:BOOL=true)
#set(vopts ${vopts} -DR_COMMAND:PATH=${R_INSTALL_DIR}/bin/R)
#set(vopts ${vopts} -D${VTK_PREFIX}_R_HOME:PATH=${R_INSTALL_DIR}/lib/R)
#set(vopts ${vopts} -DR_INCLUDE_DIR:PATH=${R_INSTALL_DIR}/lib/R/include)
#set(vopts ${vopts} -DR_LIBRARY_BASE:PATH=${R_INSTALL_DIR}/lib/R/lib/libR.${SO_EXT})
#set(vopts ${vopts} -DR_LIBRARY_LAPACK:PATH=${R_INSTALL_DIR}/lib/R/lib/libRlapack.${SO_EXT})
#set(vopts ${vopts} -DR_LIBRARY_BLAS:PATH=${R_INSTALL_DIR}/lib/R/lib/libRblas.${SO_EXT})

ExternalProject_Add(vtk
  SOURCE_DIR ${vtk_source}
  BINARY_DIR ${vtk_binary}
  INSTALL_DIR ${vtk_install}
  URL ${vtk_url}
  URL_MD5 ${vtk_md5}
  #PATCH_COMMAND 
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -DCMAKE_BUILD_TYPE:STRING=Release ${vopts}
  #BUILD_COMMAND $(MAKE)
  #INSTALL_COMMAND $(MAKE) install
  #${ep_log_options}
  )
