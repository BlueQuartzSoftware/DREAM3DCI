# DREAM3DCI #

Continuous Integration for DREAM.3D Builds

## Basic Setup #

+ You should fork this repo into your own area on GitHub
+ Branch using feature/XXXXXX naming scheme
+ For each repository, checkout the proper branch from the remote
+ Commit those changes back to your GitHub area.
+ Submit a Pull Request (PR) against this repository
+ An admin for the repo will inspect your changes and kick off a build on the Azure build environment

## Updating all the submodules to the latest 'develop' branch ##

    [DREAN3DCI]$ git checkout master
    [DREAN3DCI]$ git submodule foreach git reset --hard
    [DREAN3DCI]$ git submodule foreach git checkout develop
    [DREAN3DCI]$ git submodule foreach git pull origin develop
    [DREAN3DCI]$ git commit -s -a -m "Updating all submodules"
    [DREAN3DCI]$ git push origin master

## Add/Update the Remote for the Repositories that you wish to test ##
