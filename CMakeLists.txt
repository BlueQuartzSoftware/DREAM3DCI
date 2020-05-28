
cmake_minimum_required(VERSION 3.14.0)

#------------------------------------------------------------------------------
# Create the Top level Project
#
project(DREAM3DCI VERSION 2.0.0.0)

# This allows us to just use the "include()" command and the name of the project
set(CMAKE_MODULE_PATH 
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake" 
        "${CMAKE_CURRENT_SOURCE_DIR}/projects" 
        ${CMAKE_MODULE_PATH})

# Set up some standard defaults, these will be passed down into external the
# projects.
include(BuildType)
include(BuildLocation)
include(ExternalProject)
include(download_dir)

#--------------------------------------------------------------------------------------------------
# Are we Fetching DREAM3D itself
#--------------------------------------------------------------------------------------------------
set(extProjectName "DREAM3D")

set(CLONE_REPOS TRUE)

set(DREAM3D_WORKSPACE ${DREAM3DCI_SOURCE_DIR}/Workspace)

# Reset the variables here because we just messed with the internal layout and cmake will complain.
set(DREAM3D_Base_Repos
  CMP
  SIMPL
  SIMPLView
  H5Support
  EbsdLib
  DREAM3D
  Data
)

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
set(SIMPL_GH_ORG "bluequartzsoftware")
set(SIMPL_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# SIMPLView Details
#--------------------------------------------------------------------------------------------------
set(SIMPLView_REPO_NAME "SIMPLView")
set(SIMPLView_BASE_URL "https://www.github.com")
set(SIMPLView_GH_ORG "bluequartzsoftware")
set(SIMPLView_GIT_BRANCH "develop")

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
set(DREAM3D_GH_ORG "bluequartzsoftware")
set(DREAM3D_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# DREAM3D_Data Details
#--------------------------------------------------------------------------------------------------
set(Data_REPO_NAME "DREAM3D_Data")
set(Data_BASE_URL "https://www.github.com")
set(Data_GH_ORG "dream3d")
set(Data_GIT_BRANCH "develop")

set(GitHub_BLUEQUARTZ_Plugins
  ITKImageProcessing
  SimulationIO
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

set(GitHub_DREAM3D_Plugins
  DREAM3DReview
  UCSBUtilities 
)

#--------------------------------------------------------------------------------------------------
# DREAM3DReview Details
#--------------------------------------------------------------------------------------------------
set(DREAM3DReview_REPO_NAME "DREAM3DReview")
set(DREAM3DReview_BASE_URL "https://www.github.com")
set(DREAM3DReview_GH_ORG "dream3d")
set(DREAM3DReview_GIT_BRANCH "develop")

#--------------------------------------------------------------------------------------------------
# UCSBUtilities Details
#--------------------------------------------------------------------------------------------------
set(UCSBUtilities_REPO_NAME "UCSBUtilities")
set(UCSBUtilities_BASE_URL "https://www.github.com")
set(UCSBUtilities_GH_ORG "dream3d")
set(UCSBUtilities_GIT_BRANCH "develop")


if(EXISTS ${DREAM3D_WORKSPACE}/DREAM3D)
  message(STATUS "*------------------------------------------------------------")
  message(STATUS "*  The directory ${DREAM3D_WORKSPACE}/DREAM3D")
  message(STATUS "*  WILL be over written with a fresh checkout. If you have any unsaved changes")
  message(STATUS "*  or commits that need to be pushed. DO THAT BEFORE starting the")
  message(STATUS "*  build process.")
  message(STATUS "*------------------------------------------------------------")
endif()

#------------------------------------------------------------------------------
#
#------------------------------------------------------------------------------
function(CloneRepo)
  set(options )
  set(oneValueArgs DEPENDS PROJECT_NAME SUBDIR)
  set(multiValueArgs )
  cmake_parse_arguments(Z "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

  set(projectName ${Z_PROJECT_NAME})
  message(STATUS "Cloning ${projectName} in ${DREAM3DCI_SOURCE_DIR}/${Z_SUBDIR}/${${projectName}_REPO_NAME}" )
  ExternalProject_Add(${projectName}
  #  DEPENDS      ${Z_DEPENDS}
    TMP_DIR      ${DREAM3DCI_BINARY_DIR}/${projectName}/temp
    STAMP_DIR    ${DREAM3DCI_BINARY_DIR}/${projectName}/stamp
    DOWNLOAD_DIR ${DREAM3DCI_BINARY_DIR}/${projectName}/download
    SOURCE_DIR   ${DREAM3D_WORKSPACE}/${Z_SUBDIR}/${${projectName}_REPO_NAME}
    BINARY_DIR   ${DREAM3DCI_BINARY_DIR}/${projectName}/binary
    INSTALL_DIR  ${DREAM3DCI_BINARY_DIR}/${projectName}/install

    GIT_PROGRESS 1
    GIT_REPOSITORY "${${projectName}_BASE_URL}/${${projectName}_GH_ORG}/${${projectName}_REPO_NAME}"
    GIT_TAG ${${projectName}_GIT_BRANCH}

    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    TEST_COMMAND ""

    
    LOG_DOWNLOAD 1
    LOG_UPDATE 1
    LOG_CONFIGURE 1
    LOG_BUILD 1
    LOG_TEST 1
    LOG_INSTALL 1
  )

endfunction()



if("${DREAM3D_WORKSPACE}" STREQUAL "")
  message(FATAL_ERROR "DREAM3D_WORKSPACE is empty. Cloning DREAM.3D can not continue. \
    Please set the -DDREAM3D_WORKSPACE=/Path/to/Directory/of/DREAM3D to the directory where you want to clone all the DREAM3D \
    repositories. Anything in that directory may be over written.")
endif()

if(CLONE_REPOS)
  foreach(plugin ${DREAM3D_Base_Repos})
    CloneRepo(PROJECT_NAME ${plugin} )
  endforeach()

  foreach(plugin ${GitHub_BLUEQUARTZ_Plugins})
    CloneRepo(PROJECT_NAME ${plugin} SUBDIR "DREAM3D_Plugins")
  endforeach()

  foreach(plugin ${GitHub_DREAM3D_Plugins})
    CloneRepo(PROJECT_NAME ${plugin} SUBDIR "DREAM3D_Plugins")
  endforeach()

endif()

