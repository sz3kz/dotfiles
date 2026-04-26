.PHONY: dotfiles-init dotfiles-refresh dotfiles-update dotfiles-activate dotfiles-deinit cmake-retemplate cmake-refresh ncu-activate ncu-deactivate ncu-refresh clang-format-refresh clang-format-format clang-format-config-update
.SILENT:

REPOSITORY_ROOT_DIRECTORY=external/dotfiles/

CMAKE_CLIENT_MAKEFILE=cmake.mk
CLANG_FORMAT_CLIENT_CONFIG_FILE=clang-format-template.txt
CLANG_FORMAT_TARGET_FILE ?=
CLANG_FORMAT_CLIENT_MAKEFILE=clang-format.mk
NCU_CLIENT_MAKEFILE=ncu-compute.mk
DOTFILES_CLIENT_MAKEFILE=dotfiles.mk
LOCAL_CLIENT_MAKEFILE=local.mk
MAKEFILE_CLIENT_MAKEFILE=Client.mk

CLIENT_ROOT_DIRECTORY=../../../
MAKEFILE_DIRECTORY=make/
NCU_DIRECTORY=.ncu-compute-profiler/
BACKUP_DIRECTORY=.dotfiles-backup/

NCU_BINARY_DIRECTORY="$(shell dirname $(shell readlink -f $(shell which ncu)))"

CMAKE_TEMPLATE=cmakelists-root-template.txt

# Initialization
# 	NOTE: Ran when migrating a repository to use this centralized CMAKE submodule.
# 		Should be ran by the user directly inside the dotfiles/CPP/ directory.
# 	WHEN: Execute this after adding the repository as a submodule (+ sparsing the file tree).
# 	WHAT:
# 		* Backs up root repository's ".clang-format" + syncs clang-format configuration
# 		* Backs up root repository's "CMakeLists.txt" + syncs CMakeLists.txt configuration
# 		* Creates "make/";
# 		* Saves client's Makefile via copy to "make/";
# 		* Creates the client's Makefile.
dotfiles-init:
	echo -n "Initializing Backup Directory (Ensuring It's Existence) ... "
	mkdir -p ${CLIENT_ROOT_DIRECTORY}${BACKUP_DIRECTORY}
	echo "Done!"
	echo -n "Backing up & Syncing clang-format Configs ... "
	-mv ${CLIENT_ROOT_DIRECTORY}.clang-format ${CLIENT_ROOT_DIRECTORY}${BACKUP_DIRECTORY} 2>/dev/null && echo -n "Backed up & "
	cp ${CLANG_FORMAT_CLIENT_CONFIG_FILE} ${CLIENT_ROOT_DIRECTORY}.clang-format
	echo "Synced!"
	echo -n "Backing up CMakeLists.txt & Deploying Template ... "
	-mv ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt ${CLIENT_ROOT_DIRECTORY}${BACKUP_DIRECTORY} 2>/dev/null && echo -n "Backed up & "
	cp ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt
	echo "Synced!"
	echo -n "Initializing Make Environment ... "
	mkdir -p ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	-mv ${CLIENT_ROOT_DIRECTORY}Makefile ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${LOCAL_CLIENT_MAKEFILE} 2>/dev/null
	cp ${MAKEFILE_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}Makefile
	echo "Done!"

# Refresh(1)
# 	WHEN: Execute this after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new dotfiles.mk to user directory for direct usage.
dotfiles-refresh:
	echo -n "Refreshing dotfiles-* Commands ... "
	cp ${DOTFILES_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	echo "Done!"

# Update
# 	WHEN: Execute this if want to update submodule.
# 	WHAT: Move submodule to latest commit.
dotfiles-update:
	echo "Updating dotfiles Submodule:"
	cd ${CLIENT_ROOT_DIRECTORY} && git submodule update --init --remote
	echo "Done!"

# Activation
# 	WHEN: Execute after git cloning repository that uses submodule.
# 	WHAT: Fetch the bulk of the submodule.
# 		(*) This target will reset submodule to the version registered by
# 		the last commit, so if user wants to revert submodule version
# 		after Update but BEFORE commiting, this is their go-to.
dotfiles-activate:
	echo -n "Activating dotfiles Submodule ... "
	git submodule update --init
	echo "Done!"

# Deinitialization
# 	WHEN: Execute if want remove submodule usage from repository.
# 	WHAT:
# 		* Deletes ".clang-format" (or restores from backup)
# 		* Deletes "CMakeLists.txt" (or restores from backup)
# 		* Deletes "make/" directory;
# 		* Restores client's makefile;
# 		* Deletes the submodule.
dotfiles-deinit:
	echo -n "Deinitializing clang-format ... "
	rm ${CLIENT_ROOT_DIRECTORY}.clang-format # overwriting is optional, but deletion must be mandatory
	-mv ${CLIENT_ROOT_DIRECTORY}${BACKUP_DIRECTORY}.clang-format ${CLIENT_ROOT_DIRECTORY}.clang-format 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Deinitializing CMakeList.txt ... "
	rm ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt # overwriting is optional, but deletion must be mandatory
	-mv ${CLIENT_ROOT_DIRECTORY}${BACKUP_DIRECTORY}CMakeLists.txt ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Removing Backup Directory ... "
	rmdir ${CLIENT_ROOT_DIRECTORY}${BACKUP_DIRECTORY}
	echo "Done!"
	echo -n "Deinitializing Make Environment ..."
	rm ${CLIENT_ROOT_DIRECTORY}Makefile 	# overwriting is optional, but deletion must be mandatory
	-mv ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}${LOCAL_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}Makefile 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	rm -r ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	echo "Removing Submodule: "
	cd ${CLIENT_ROOT_DIRECTORY} && git submodule deinit -f external/dotfiles && git rm external/dotfiles/ && echo "Done!"

# CMAKE: Retemplation
# 	WHEN: Execute after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after Update introduced changes to CMakeLists-Root-Template.txt .
# 	What: Overwrites / Copies the CMakeLists-Root-Template.txt to client.
cmake-retemplate: 
	echo -n "Redeploying Template ... "
	cp ${CMAKE_TEMPLATE} ${CLIENT_ROOT_DIRECTORY}CMakeLists.txt
	echo "Done!"

# CMAKE: Refresh(2):
# 	WHEN: Execute this after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new cmake.mk to user directory for direct usage.
cmake-refresh:
	echo -n "Refreshing cmake-* Commands ... "
	cp ${CMAKE_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}
	echo "Done!"

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
	 rm -rf ${CLIENT_ROOT_DIRECTORY}${NCU_DIRECTORY}

# NCU: Refresh(3):
# 	WHEN: Execute this after Initialization in the dotfiles/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new ncu-compute.mk to user directory for direct usage.
ncu-refresh:
	cp ${NCU_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}

clang-format-refresh:
	cp ${CLANG_FORMAT_CLIENT_MAKEFILE} ${CLIENT_ROOT_DIRECTORY}${MAKEFILE_DIRECTORY}

clang-format-format:
	cd ${CLIENT_ROOT_DIRECTORY} && clang-format -i -style=file $(CLANG_FORMAT_TARGET_FILE)

clang-format-config-update:
	-cp -i ${CLANG_FORMAT_CLIENT_CONFIG_FILE} ${CLIENT_ROOT_DIRECTORY}
