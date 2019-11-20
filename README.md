# DREAM3DCI #

Continuous Integration for DREAM.3D Builds

## Basic Setup #

+ You should fork this repo into your own area on GitHub
+ Branch using feature/XXXXXX naming scheme
+ For each repository, checkout the proper branch from the remote
+ Commit those changes back to your GitHub area.
+ Submit a Pull Request (PR) against this repository
+ An admin for the repo will inspect your changes and kick off a build on the Azure build environment

The following is an example of setting the branch for the ITKImageProcessing Plugin

      547:[mjackson@ferb:DREAM3DCI]$ cd DREAM3D_Plugins/
      549:[mjackson@ferb:DREAM3D_Plugins]$ cd ITKImageProcessing/
      550:[mjackson@ferb:ITKImageProcessing]$ git remote remove origin
      551:[mjackson@ferb:ITKImageProcessing]$ git remote add origin git@github.com:imikejackson/ITKImageProcessing
      552:[mjackson@ferb:ITKImageProcessing]$ git fetch --all 
      553:[mjackson@ferb:ITKImageProcessing]$ git checkout -b feature/Blend_Grayscale origin/feature/Blend_Grayscale
      Branch 'feature/Blend_Grayscale' set up to track remote branch 'feature/Blend_Grayscale' from 'origin'.
      Switched to a new branch 'feature/Blend_Grayscale'
