# - Config file for the kinenik package
# It defines the following variables
#  kinenik_INCLUDE_DIRS - include directories for kinenik
#  kinenik_DEFINITIONS - definitions to use with the kinenik Lib
#  kinenik_LIBRARIES    - library to link against kinenik Lib


include(CMakeFindDependencyMacro)

# Find dependencies
find_package( Eigen3 REQUIRED )

# Our library dependencies (contains definitions for IMPORTED targets)
include("${CMAKE_CURRENT_LIST_DIR}/kinenikTargets.cmake")

# These are IMPORTED targets created by kinenikTargets.cmake
set(kinenik_LIBRARIES kinenik::kinenik)
