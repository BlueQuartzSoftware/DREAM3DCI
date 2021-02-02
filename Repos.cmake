set(DREAM3D_Base_Repos
  CMP
  SIMPL
  SIMPLView
  H5Support
  EbsdLib
  DREAM3D
)

if(CI_CLONE_DREAM3D_DATA)
  list(APPEND DREAM3D_Base_Repos DREAM3D_Data)
endif()

#--------------------------------------------------------------------------------------------------
# CMP Details
#--------------------------------------------------------------------------------------------------
set(CMP_REPO_NAME "CMP")
set(CMP_BASE_URL "https://www.github.com")
set(CMP_GH_ORG "bluequartzsoftware")
set(CMP_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# SIMPL Details
#--------------------------------------------------------------------------------------------------
set(SIMPL_REPO_NAME "SIMPL")
set(SIMPL_BASE_URL "https://www.github.com")
set(SIMPL_GH_ORG "imikejackson")
set(SIMPL_GIT_BRANCH "topic/qm_melt_pool_multi_file")

#--------------------------------------------------------------------------------------------------
# SIMPLView Details
#--------------------------------------------------------------------------------------------------
set(SIMPLView_REPO_NAME "SIMPLView")
set(SIMPLView_BASE_URL "https://www.github.com")
set(SIMPLView_GH_ORG "imikejackson")
set(SIMPLView_GIT_BRANCH "topic/qm_melt_pool_multi_file")

#--------------------------------------------------------------------------------------------------
# H5Support Details
#--------------------------------------------------------------------------------------------------
set(H5Support_REPO_NAME "H5Support")
set(H5Support_BASE_URL "https://www.github.com")
set(H5Support_GH_ORG "bluequartzsoftware")
set(H5Support_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# EbsdLib Details
#--------------------------------------------------------------------------------------------------
set(EbsdLib_REPO_NAME "EbsdLib")
set(EbsdLib_BASE_URL "https://www.github.com")
set(EbsdLib_GH_ORG "bluequartzsoftware")
set(EbsdLib_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# DREAM3D Details
#--------------------------------------------------------------------------------------------------
set(DREAM3D_REPO_NAME "DREAM3D")
set(DREAM3D_BASE_URL "https://www.github.com")
set(DREAM3D_GH_ORG "imikejackson")
set(DREAM3D_GIT_BRANCH "topic/change_resolution_fixes")

#--------------------------------------------------------------------------------------------------
# DREAM3D_Data Details
#--------------------------------------------------------------------------------------------------
set(DREAM3D_Data_REPO_NAME "DREAM3D_Data")
set(DREAM3D_Data_BASE_URL "https://www.github.com")
set(DREAM3D_Data_GH_ORG "dream3d")
set(DREAM3D_Data_GIT_BRANCH "develop")

set(DREAM3D_Plugins
  ITKImageProcessing
  SimulationIO
  DREAM3DReview
  UCSBUtilities
)

#--------------------------------------------------------------------------------------------------
# ITKImageProcessing Details
#--------------------------------------------------------------------------------------------------
set(ITKImageProcessing_REPO_NAME "ITKImageProcessing")
set(ITKImageProcessing_BASE_URL "https://www.github.com")
set(ITKImageProcessing_GH_ORG "bluequartzsoftware")
set(ITKImageProcessing_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# SimulationIO Details
#--------------------------------------------------------------------------------------------------
set(SimulationIO_REPO_NAME "SimulationIO")
set(SimulationIO_BASE_URL "https://www.github.com")
set(SimulationIO_GH_ORG "bluequartzsoftware")
set(SimulationIO_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# DREAM3DReview Details
#--------------------------------------------------------------------------------------------------
set(DREAM3DReview_REPO_NAME "DREAM3DReview")
set(DREAM3DReview_BASE_URL "https://www.github.com")
set(DREAM3DReview_GH_ORG "imikejackson")
set(DREAM3DReview_GIT_BRANCH "topic/qm_melt_pool_multi_file")

#--------------------------------------------------------------------------------------------------
# UCSBUtilities Details
#--------------------------------------------------------------------------------------------------
set(UCSBUtilities_REPO_NAME "UCSBUtilities")
set(UCSBUtilities_BASE_URL "https://www.github.com")
set(UCSBUtilities_GH_ORG "dream3d")
set(UCSBUtilities_GIT_BRANCH "develop")
