add_hostconfig(boxlib "VISIT_OPTION_DEFAULT(VISIT_BOXLIB_DIR ${boxlib_install})")

ExternalProject_Add(boxlib
  DOWNLOAD_COMMAND ${WGET} ${boxlib_url} -O ${CMAKE_CURRENT_BINARY_DIR}/${boxlib_name}.tar.gz
  #DOWNLOAD_DIR ${boxlib_source}
  SOURCE_DIR ${boxlib_source}
  BINARY_DIR ${boxlib_binary}
  INSTALL_DIR ${boxlib_install}
  URL ${boxlib_url}
  URL_MD5 ${boxlib_md5}
  UPDATE_COMMAND tar xvzf ${CMAKE_CURRENT_BINARY_DIR}/${boxlib_name}.tar.gz -C ${CMAKE_BINARY_DIR}
  #PATCH_COMMAND ""
  #CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${boxlib_install} -DBL_SPACEDIM=2
)

file(WRITE ${CMAKE_BINARY_DIR}/boxlib_patch 
"diff --git a/CMakeLists.txt b/CMakeLists.txt.2
index 066ec27..6bd8b2f 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt.2
@@ -17,7 +17,7 @@ set(CXX_source_files)
 set(C_source_files fabio_c.c  ppm_util_c.c  system_util_c.c  timer_c.c)
 set(F77_source_files)
 set(FPP_source_files)
-set(F90_source_files f2kcli.f90 bc.f90 bl_constants.f90 bl_error.f90 bl_IO.f90 bl_mem_stat.f90 bl_space.f90 bl_stream.f90 bl_string.f90 bl_system.f90 bl_timer.f90 bl_types.f90 bndry_reg.f90 boxarray_f.f90 box_f.f90 boxlib_f.f90 box_util.f90 cluster_f.f90 create_umac_grown.f90 cutcells.f90 define_bc_tower.f90 fab.f90 fabio.f90 filler.f90 fillpatch.f90 fourth_order_interp_coeffs.f90 interp.f90 knapsack.f90 layout.f90 list_box.f90 make_new_grids.f90 ml_boxarray.f90 ml_layout.f90 ml_multifab.f90 multifab_f.f90 multifab_fill_ghost_cells.f90 multifab_physbc_edgevel.f90 multifab_physbc.f90 plotfile.f90 ppm_util.f90 sort_box.f90 sort_d.f90 sort_i.f90 tag_boxes.f90 vector_i.f90)
+set(F90_source_files f2kcli.f90 bc.f90 bl_constants.f90 bl_error.f90 bl_IO.f90 bl_mem_stat.f90 bl_space.f90 bl_stream.f90 bl_string.f90 bl_system.f90 bl_timer.f90 bl_types.f90 bndry_reg.f90 boxarray_f.f90 box_f.f90 boxlib_f.f90 box_util.f90 cluster_f.f90 create_umac_grown.f90 cutcells.f90 define_bc_tower.f90 fab.f90 fabio.f90 filler.f90 fillpatch.f90 fourth_order_interp_coeffs.f90 interp.f90 knapsack.f90 layout.f90 list_box.f90 make_new_grids.f90 ml_boxarray.f90 ml_layout.f90 ml_multifab.f90 multifab_f.f90 multifab_fill_ghost_cells.f90 multifab_physbc_edgevel.f90 multifab_physbc.f90 pingpong.f90 plotfile.f90 ppm_util.f90 sort_box.f90 sort_d.f90 sort_i.f90 tag_boxes.f90 vector_i.f90)
 
 if (ENABLE_MPI)
   list(APPEND F90_source_files parallel.f90)
")

ExternalProject_Add_Step(boxlib boxlib_patch
  COMMAND echo "patch -R CMakeLists.txt ${CMAKE_CURRENT_BINARY_DIR}/boxlib_patch"
  COMMAND patch -R CMakeLists.txt ${CMAKE_CURRENT_BINARY_DIR}/boxlib_patch
  DEPENDEES update
  DEPENDERS configure
  WORKING_DIRECTORY ${boxlib_source}/Src/F_BaseLib
)


set(cdefs2D  "${CMAKE_C_FLAGS} -DBox=Box2D -DBoxArray=BoxArray2D -DBoxDomain=BoxDomain2D -DBoxList=BoxList2D -DDistributionMapping=DistributionMapping2D -DFABio=FABio2D -DFABio_8bit=FABio_8bit2D -DFABio_ascii=FABio_ascii2D -DFABio_binary=FABio_binary2D -DFArrayBox=FArrayBox2D -DFabArrayBase=FabArrayBase2D -DFabArrayId=FabArrayId2D -DFillBoxId=FillBoxId2D -DIndexType=IndexType2D -DIntVect=IntVect2D -DMFIter=MFIter2D -DMultiFab=MultiFab2D -DMultiFabCopyDescriptor=MultiFabCopyDescriptor2D -DMultiFabId=MultiFabId2D -DParallelDescriptor=ParallelDescriptor2D -DParmParse=ParmParse2D -DRealBox=RealBox2D -DVisMF=VisMF2D")
set(cxxdefs2D  "${CMAKE_CXX_FLAGS} -DBox=Box2D -DBoxArray=BoxArray2D -DBoxDomain=BoxDomain2D -DBoxList=BoxList2D -DDistributionMapping=DistributionMapping2D -DFABio=FABio2D -DFABio_8bit=FABio_8bit2D -DFABio_ascii=FABio_ascii2D -DFABio_binary=FABio_binary2D -DFArrayBox=FArrayBox2D -DFabArrayBase=FabArrayBase2D -DFabArrayId=FabArrayId2D -DFillBoxId=FillBoxId2D -DIndexType=IndexType2D -DIntVect=IntVect2D -DMFIter=MFIter2D -DMultiFab=MultiFab2D -DMultiFabCopyDescriptor=MultiFabCopyDescriptor2D -DMultiFabId=MultiFabId2D -DParallelDescriptor=ParallelDescriptor2D -DParmParse=ParmParse2D -DRealBox=RealBox2D -DVisMF=VisMF2D")


set(cdefs3D  "${CMAKE_C_FLAGS} -DBox=Box3D -DBoxArray=BoxArray3D -DBoxDomain=BoxDomain3D -DBoxList=BoxList3D -DDistributionMapping=DistributionMapping3D -DFABio=FABio3D -DFABio_8bit=FABio_8bit3D -DFABio_ascii=FABio_ascii3D -DFABio_binary=FABio_binary3D -DFArrayBox=FArrayBox3D -DFabArrayBase=FabArrayBase3D -DFabArrayId=FabArrayId3D -DFillBoxId=FillBoxId3D -DIndexType=IndexType3D -DIntVect=IntVect3D -DMFIter=MFIter3D -DMultiFab=MultiFab3D -DMultiFabCopyDescriptor=MultiFabCopyDescriptor3D -DMultiFabId=MultiFabId3D -DParallelDescriptor=ParallelDescriptor3D -DParmParse=ParmParse3D -DRealBox=RealBox3D -DVisMF=VisMF3D")

set(cxxdefs3D  "${CMAKE_CXX_FLAGS} -DBox=Box3D -DBoxArray=BoxArray3D -DBoxDomain=BoxDomain3D -DBoxList=BoxList3D -DDistributionMapping=DistributionMapping3D -DFABio=FABio3D -DFABio_8bit=FABio_8bit3D -DFABio_ascii=FABio_ascii3D -DFABio_binary=FABio_binary3D -DFArrayBox=FArrayBox3D -DFabArrayBase=FabArrayBase3D -DFabArrayId=FabArrayId3D -DFillBoxId=FillBoxId3D -DIndexType=IndexType3D -DIntVect=IntVect3D -DMFIter=MFIter3D -DMultiFab=MultiFab3D -DMultiFabCopyDescriptor=MultiFabCopyDescriptor3D -DMultiFabId=MultiFabId3D -DParallelDescriptor=ParallelDescriptor3D -DParmParse=ParmParse3D -DRealBox=RealBox3D -DVisMF=VisMF3D")

ExternalProject_Add_Step(boxlib boxlib2D_installer
  COMMAND ${CMAKE_COMMAND} -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_INSTALL_PREFIX=${boxlib_install} -DBL_SPACEDIM=2 -DENABLE_MPI=0 -DENABLE_OpenMP=0 -DBL_PRECISION=DOUBLE -DCMAKE_C_FLAGS=${cdefs3D} -DCMAKE_CXX_FLAGS=${cxxdefs2D}
  COMMAND $(MAKE) install
  DEPENDEES install
  WORKING_DIRECTORY ${boxlib_source}
)

ExternalProject_Add_Step(boxlib boxlib3D_installer
  COMMAND ${CMAKE_COMMAND} -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_INSTALL_PREFIX=${boxlib_install} -DBL_SPACEDIM=3 -DENABLE_MPI=0 -DENABLE_OpenMP=0 -DBL_PRECISION=DOUBLE -DCMAKE_C_FLAGS=${cdefs3D} -DCMAKE_CXX_FLAGS=${cxxdefs3D}
  COMMAND $(MAKE) install
  DEPENDEES boxlib2D_installer #3D has to wait until 2D finishes (for now)..
  WORKING_DIRECTORY ${boxlib_source}
)



