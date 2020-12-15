cmake_minimum_required(VERSION 3.14.0)

project(DREAM3DCI VERSION 2.0.0.0 LANGUAGES NONE)

include(ExternalProject)

set(DREAM3D_WORKSPACE ${DREAM3DCI_SOURCE_DIR}/Workspace CACHE PATH "Root directory where repos will be cloned")
option(CI_CLONE_DREAM3D_DATA "Clone DREAM3D_Data repo" ON)

include(${PROJECT_SOURCE_DIR}/Repos.cmake)

#------------------------------------------------------------------------------
# Function to clone the repository using ExternalProject_Add
#------------------------------------------------------------------------------
function(CloneRepo)
  set(options)
  set(oneValueArgs NAME ROOT_DIR GIT_REPO GIT_TAG)
  set(multiValueArgs)
  cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  set(CLONE_DIR ${ARGS_ROOT_DIR}/${ARGS_NAME})

  message(STATUS "Cloning \"${ARGS_GIT_REPO}\" at tag \"${ARGS_GIT_TAG}\" in \"${CLONE_DIR}\"" )
  ExternalProject_Add(${ARGS_NAME}
    GIT_REPOSITORY ${ARGS_GIT_REPO}
    GIT_TAG ${ARGS_GIT_TAG}
    GIT_PROGRESS ON
    GIT_SHALLOW ON

    SOURCE_DIR ${CLONE_DIR}

    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    TEST_COMMAND ""

    TMP_DIR ${PROJECT_BINARY_DIR}/${ARGS_NAME}/temp
    STAMP_DIR ${PROJECT_BINARY_DIR}/${ARGS_NAME}/stamp
    DOWNLOAD_DIR ${PROJECT_BINARY_DIR}/${ARGS_NAME}/download
    BINARY_DIR ${PROJECT_BINARY_DIR}/${ARGS_NAME}/binary
    INSTALL_DIR ${PROJECT_BINARY_DIR}/${ARGS_NAME}/install
    
    LOG_DOWNLOAD ON
    LOG_UPDATE ON
    LOG_CONFIGURE ON
    LOG_BUILD ON
    LOG_TEST ON
    LOG_INSTALL ON
  )
endfunction()

if("${DREAM3D_WORKSPACE}" STREQUAL "")
  message(FATAL_ERROR "DREAM3D_WORKSPACE is empty. Cloning DREAM.3D can not continue. \
    Please set the -DDREAM3D_WORKSPACE=/Path/to/Directory/of/DREAM3D to the directory where you want to clone all the DREAM3D \
    repositories. Anything in that directory may be over written.")
endif()

foreach(plugin ${DREAM3D_Base_Repos})
  CloneRepo(NAME ${plugin}
    GIT_REPO "${${plugin}_BASE_URL}/${${plugin}_GH_ORG}/${${plugin}_REPO_NAME}.git"
    GIT_TAG "${${plugin}_GIT_BRANCH}"
    ROOT_DIR "${DREAM3D_WORKSPACE}"
  )
endforeach()

foreach(plugin ${DREAM3D_Plugins})
  CloneRepo(NAME ${plugin}
    GIT_REPO "${${plugin}_BASE_URL}/${${plugin}_GH_ORG}/${${plugin}_REPO_NAME}.git"
    GIT_TAG "${${plugin}_GIT_BRANCH}"
    ROOT_DIR "${DREAM3D_WORKSPACE}/DREAM3D_Plugins"
  )
endforeach()
