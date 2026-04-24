.PHONY: dotfiles-init dotfiles-refresh dotfiles-update dotfiles-activate dotfiles-deinit cmake-retemplate cmake-refresh ncu-activate ncu-deactivate ncu-refresh

REPOSITORY_ROOT_DIRECTORY=external/dotfiles/

CMAKE_CLIENT_MAKEFILE=cmake.mk
NCU_CLIENT_MAKEFILE=ncu-compute.mk
DOTFILES_CLIENT_MAKEFILE=dotfiles.mk
LOCAL_CLIENT_MAKEFILE=local.mk
MAKEFILE_CLIENT_MAKEFILE=Client.mk

CLIENT_ROOT_DIRECTORY=../../../
MAKEFILE_DIRECTORY=make/
NCU_DIRECTORY=.ncu-compute-profiler/

NCU_BINARY_DIRECTORY="$(shell dirname $(shell readlink -f $(shell which ncu)))"

CMAKE_TEMPLATE=CMakeLists-Root-Template.txt

# Initialization
# 	NOTE: Ran when migrating a repository to use this centralized CMAKE submodule.
# 		Should be ran by the user directly inside the dotfiles/CPP/ directory.
# 	WHEN: Execute this after adding the repository as a submodule (+ sparsing the file tree).
# 	WHAT: Creates "make/", saves client's Makefile via copy to "make/", creates the client's Makefile.
dotfiles-init:
	-mkdir ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	-mv ${CLIENT_ROOT_DIRECTORY}Makefile ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${LOCAL_CLIENT_MAKEFILE}
	cp ${MAKEFILE_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}Makefile

# Refresh(1)
# 	WHEN: Execute this after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new dotfiles.mk to user directory for direct usage.
dotfiles-refresh:
	cp ${DOTFILES_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}

# Update
# 	WHEN: Execute this if want to update submodule.
# 	WHAT: Move submodule to latest commit.
dotfiles-update:
	cd ${CLIENT_ROOT_DIRECTORY} && git submodule update --init --remote

# Activation
# 	WHEN: Execute after git cloning repository that uses submodule.
# 	WHAT: Fetch the bulk of the submodule.
dotfiles-activate:
	git submodule update --init

# Deinitialization
# 	WHEN: Execute if want remove submodule usage from repository.
# 	WHAT: Deletes "make/" directory, restores client's makefile, deletes the submodule.
dotfiles-deinit:
	rm ${CLIENT_ROOT_DIRECTORY}Makefile 	# overwriting is optional, but deletion must be mandatory
	-mv ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${LOCAL_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}Makefile
	rm -r ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	-rm -i ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt
	cd ${CLIENT_ROOT_DIRECTORY} && git submodule deinit -f external/dotfiles && git rm external/dotfiles/

# CMAKE: Retemplation
# 	WHEN: Execute after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after Update introduced changes to CMakeLists-Root-Template.txt .
# 	What: Overwrites / Copies the CMakeLists-Root-Template.txt to client.
cmake-retemplate: 
	cp ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt

# CMAKE: Refresh(2):
# 	WHEN: Execute this after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new cmake.mk to user directory for direct usage.
cmake-refresh:
	cp ${CMAKE_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}

# NCU: Activation
# 	WHEN: Execute after git cloning repository that uses submodule.
# 	WHAT: Copies section directory (solves hard-coded RO paths problem on NixOS).
ncu-activate:
	mkdir ${CLIENT_ROOT_DIRECTORY}${NCU_DIRECTORY}
	cp ${NCU_BINARY_DIRECTORY}/sections/*.section ${CLIENT_ROOT_DIRECTORY}${NCU_DIRECTORY}
	cp ${NCU_BINARY_DIRECTORY}/sections/*.py ${CLIENT_ROOT_DIRECTORY}${NCU_DIRECTORY}


# NCU: Deactivation
# 	WHEN: ??? want save space?
# 	WHAT: Deletes ncu section directory.
ncu-deactivate:
	 rm -r ${CLIENT_ROOT_DIRECTORY}${NCU_DIRECTORY}

# NCU: Refresh(3):
# 	WHEN: Execute this after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new ncu-compute.mk to user directory for direct usage.
ncu-refresh:
	cp ${NCU_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
