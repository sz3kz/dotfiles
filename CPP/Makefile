.PHONY: dotfiles-sync cmake-sync cmake-initialize ncu-sync


CLIENT_ROOT_DIRECTORY=../../../

CMAKE_TEMPLATE=CMakeLists-Root-Template.txt
MAKEFILE_DIRECTORY=make/

CMAKE_CLIENT_MAKEFILE=cmake.mk
NCU_CLIENT_MAKEFILE=ncu-compute.mk
DOTFILES_CLIENT_MAKEFILE=dotfiles.mk

# Create the "make/" directory
dotfiles-setup:
	-mkdir ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}

# Copy dotfiles makefile to "make/" directory
dotfiles-sync:
	cp ${DOTFILES_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${DOTFILES_CLIENT_MAKEFILE}


# Copy cmake makefile to "make/" directory
cmake-sync:
	cp ${CMAKE_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${CMAKE_CLIENT_MAKEFILE}

# cmake-sync + provide cmakelists.txt template
cmake-initialize: cmake-sync
	-cp -i ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt

# Copy ncu makefile to "make/" directory
ncu-sync:
	cp ${NCU_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${NCU_CLIENT_MAKEFILE}
