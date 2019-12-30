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

    [DREAN3DCI]$ git submodule foreach "(git reset --hard;git checkout develop;git pull --rebase origin develop)"
    [DREAN3DCI]$ git add .
    [DREAN3DCI]$ git commit -s -a -m "Updating submodules"

If you want to show the commit hash and commit date of each submodule you can try this:
    [DREAN3DCI]$ git submodule foreach "(git rev-parse --verify HEAD;git log -1 --pretty='%cd' --date=format:%Y-%m-%d-%H:%M:%S)"

## Add/Update the Remote for the Repositories that you wish to test ##
