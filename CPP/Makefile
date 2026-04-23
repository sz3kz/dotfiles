.PHONY: dotfiles-init dotfiles-refresh dotfiles-update dotfiles-activate dotfiles-deinit cmake-retemplate cmake-refresh ncu-activate ncu-deactivate ncu-refresh

REPOSITORY_ROOT_DIRECTORY=external/dotfiles/

CMAKE_CLIENT_MAKEFILE=cmake.mk
NCU_CLIENT_MAKEFILE=ncu-compute.mk
DOTFILES_CLIENT_MAKEFILE=dotfiles.mk

CLIENT_ROOT_DIRECTORY=../../../
MAKEFILE_DIRECTORY=make/
CLIENT_MAKEFILE_DIRECTORY=${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}

CMAKE_TEMPLATE=CMakeLists-Root-Template.txt

NCU_CLIENT_DIRECTORY=${CLIENT_ROOT_DIRECTORY}.ncu-compute-profiler/
NCU_BINARY_PATH=$(shell which ncu)



# Initialize (git submodule add + git sparse ... + run this)
dotfiles-init:
	-cd ${CLIENT_ROOT_DIRECTORY} && mkdir ${MAKEFILE_DIRECTORY}
	#cp ${DOTFILES_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
	#cp ${NCU_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
	#cp ${CMAKE_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
	#-cp -i ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt

# dotfiles: copy makefile
dotfiles-refresh:
	cp ${DOTFILES_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}

# Update  ( Update commit + copy fresh make files + ask to overwrite cmakelists.txt)
dotfiles-update:
	cd ${CLIENT_ROOT_DIRECTORY} && git submodule update --init --remote
	#cp ${DOTFILES_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
	#cp ${NCU_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
	#cp ${CMAKE_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
	#-cp -i ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt

# Activate (git clone -> only want the CPP/*.cmake files)
dotfiles-activate:
	git submodule update --init

# Delete submodule
dotfiles-deinit:
	rm -r ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	rm -i ${CLIENT_ROOT_DIRECTORY}Makefile
	cd ${CLIENT_ROOT_DIRECTORY} && git submodule deinit -f external/dotfiles && git rm external/dotfiles/

# CMAKE: overwrite CMakeLists.txt with the template (WILL NOT ASK)
cmake-retemplate: 
	cp -i ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt

# CMAKE: copy makefile
cmake-refresh:
	cp ${CMAKE_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}

# NCU: activate the section directory( want to copy the *.section and *.py files)
ncu-activate:
	mkdir ${NCU_SECTION_DIRECTORY}
	cp ${NCU_BINARY_PATH}../../sections/*.section ${NCU_CLIENT_DIRECTORY}
	cp ${NCU_BINARY_PATH}../../sections/*.py ${NCU_CLIENT_DIRECTORY}

# NCU: delete the section directory
ncu-deactivate:
	 rm -r ${NCU_CLIENT_DIRECTORY}

# NCU: copy makefile
ncu-refresh:
	cp ${NCU_CLIENT_MAKEFILE} ${CLIENT_MAKEFILE_DIRECTORY}
