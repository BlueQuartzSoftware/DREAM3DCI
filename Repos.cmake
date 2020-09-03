set(DREAM3D_Base_Repos
  CMP
  SIMPL
  SIMPLView
  DREAM3D
  DREAM3D_Data
)

#--------------------------------------------------------------------------------------------------
# CMP Details
#--------------------------------------------------------------------------------------------------
set(CMP_REPO_NAME "CMP")
set(CMP_BASE_URL "https://www.github.com")
set(CMP_GH_ORG "bluequartzsoftware")
set(CMP_GIT_BRANCH "v6_5_141")

#--------------------------------------------------------------------------------------------------
# SIMPL Details
#--------------------------------------------------------------------------------------------------
set(SIMPL_REPO_NAME "SIMPL")
set(SIMPL_BASE_URL "https://www.github.com")
set(SIMPL_GH_ORG "bluequartzsoftware")
set(SIMPL_GIT_BRANCH "v6_5_141")

#--------------------------------------------------------------------------------------------------
# SIMPLView Details
#--------------------------------------------------------------------------------------------------
set(SIMPLView_REPO_NAME "SIMPLView")
set(SIMPLView_BASE_URL "https://www.github.com")
set(SIMPLView_GH_ORG "bluequartzsoftware")
set(SIMPLView_GIT_BRANCH "v6_5_141")

#--------------------------------------------------------------------------------------------------
# H5Support Details
#--------------------------------------------------------------------------------------------------
set(H5Support_REPO_NAME "H5Support")
set(H5Support_BASE_URL "https://www.github.com")
set(H5Support_GH_ORG "bluequartzsoftware")
set(H5Support_GIT_BRANCH "v6_5_141")

#--------------------------------------------------------------------------------------------------
# EbsdLib Details
#--------------------------------------------------------------------------------------------------
set(EbsdLib_REPO_NAME "EbsdLib")
set(EbsdLib_BASE_URL "https://www.github.com")
set(EbsdLib_GH_ORG "bluequartzsoftware")
set(EbsdLib_GIT_BRANCH "v6_5_141")

#--------------------------------------------------------------------------------------------------
# DREAM3D Details
#--------------------------------------------------------------------------------------------------
set(DREAM3D_REPO_NAME "DREAM3D")
set(DREAM3D_BASE_URL "https://www.github.com")
set(DREAM3D_GH_ORG "bluequartzsoftware")
set(DREAM3D_GIT_BRANCH "v6_5_141")

#--------------------------------------------------------------------------------------------------
# DREAM3D_Data Details
#--------------------------------------------------------------------------------------------------
set(DREAM3D_Data_REPO_NAME "DREAM3D_Data")
set(DREAM3D_Data_BASE_URL "https://www.github.com")
set(DREAM3D_Data_GH_ORG "dream3d")
set(DREAM3D_Data_GIT_BRANCH "develop")

set(DREAM3D_D3D_Plugins
  Anisotropy
  DDDAnalysisToolbox
  DREAM3DReview
  HEDMAnalysis
  MASSIFUtilities
  TransformationPhase
  UCSBUtilities
)

set(DREAM3D_BQ_Plugins
  ITKImageProcessing
  SimulationIO
  ZeissImport
)

set(DREAM3D_Plugins
  ${DREAM3D_D3D_Plugins}
  ${DREAM3D_BQ_Plugins}
)

foreach(p ${DREAM3D_D3D_Plugins})
  set(${p}_REPO_NAME "${p}")
  set(${p}_BASE_URL "https://www.github.com")
  set(${p}_GH_ORG "dream3d")
  set(${p}_GIT_BRANCH "v6_5_141")
endforeach()

foreach(p ${DREAM3D_BQ_Plugins})
  set(${p}_REPO_NAME "${p}")
  set(${p}_BASE_URL "https://www.github.com")
  set(${p}_GH_ORG "bluequartzsoftware")
  set(${p}_GIT_BRANCH "v6_5_141")
endforeach()

