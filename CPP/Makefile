.PHONY: boilerplate-init boilerplate-refresh boilerplate-update boilerplate-activate boilerplate-deinit boilerplate-check-prerequesites cmake-retemplate cmake-refresh ncu-activate ncu-deactivate ncu-refresh clang-refresh clang-update-format clang-update-tidy clang-rehook
.SILENT:


MAKEFILE_CMAKE=cmake.mk
MAKEFILE_GIT=git.mk
MAKEFILE_CLANG=clang.mk
MAKEFILE_NCU=ncu-compute.mk
MAKEFILE_DOTFILES=boilerplate.mk
MAKEFILE_LOCAL=local.mk
MAKEFILE_CLIENT=Client.mk

PATH_SUBMODULE=external/boilerplate
DIRECTORY_ROOT_SUBMODULE=external/boilerplate/
DIRECTORY_ROOT_CLIENT=../../../
DIRECTORY_MAKE=make/
DIRECTORY_BACKUP=.boilerplate-backup/
DIRECTORY_NCU_CLIENT=.ncu-compute-profiler/
DIRECTORY_NCU_BINARY="$(shell dirname $(shell readlink -f $(shell which ncu)))"

TEMPLATE_CMAKE_ROOT=cmakelists-root-template.txt
TEMPLATE_CLANG_FORMAT=clang-format-template.txt
TEMPLATE_CLANG_TIDY=clang-tidy-template.txt
TEMPLATE_CLANG_PRECOMMIT_HOOK=clang-precommit-hook-template.yaml
TEMPLATE_GITIGNORE=gitignore-template.txt


# Prerequesite Checking
# 	WHEN: Execute this if want to check needed software for the project to work.
# 		Should ideally be only ran as a dependency of boilerplate-init .
# 	What: Checks if installed:
# 		* make;
# 		* cmake;
# 		* pre-commit;
# 		* git;
# 		* clang;
# 		* clang-format;
# 		* clang-tidy.
boilerplate-check-prerequesites:
	echo -n "Checking Prerequesite make:          "
	command -v make >/dev/null
	echo "Installed!"
	echo -n "Checking Prerequesite cmake:         "
	command -v cmake >/dev/null
	echo "Installed!"
	echo -n "Checking Prerequesite pre-commit:    "
	command -v pre-commit >/dev/null
	echo "Installed!"
	echo -n "Checking Prerequesite git:           "
	command -v git >/dev/null
	echo "Installed!"
	echo -n "Checking Prerequesite clang:         "
	command -v clang >/dev/null
	echo "Installed!"
	echo -n "Checking Prerequesite clang-format:  "
	command -v clang-format >/dev/null
	echo "Installed!"
	echo -n "Checking Prerequesite clang-tidy:    "
	command -v clang-tidy >/dev/null
	echo "Installed!"
	echo "Prerequesite Check Ended Successfully!"

# Initialization
# 	NOTE: Ran when migrating a repository to use this centralized CMAKE submodule.
# 		Should be ran by the user directly inside the boilerplate/CPP/ directory.
# 	WHEN: Execute this after adding the repository as a submodule (+ sparsing the file tree).
# 	WHAT:
# 		* Backs up root repository's ".clang-format" + syncs clang-format options
# 		* Backs up root repository's ".clang-tidy" + syncs clang-tidy options
# 		* Backs up root repository's ".pre-commit-config.yaml" + syncs the clang pre-commit hook
# 		* Backs up root repository's "CMakeLists.txt" + syncs CMakeLists.txt configuration
# 		* Installs the .pre-commit-config.yaml as a git hook
# 		* Creates "make/";
# 		* Saves client's Makefile via copy to "make/";
# 		* Creates the client's Makefile.
boilerplate-init: boilerplate-check-prerequesites
	echo -n "Initializing Backup Directory (Ensuring It's Existence) ... "
	mkdir -p ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}
	echo "Done!"
	echo -n "Backing up & Syncing clang-format Options ... "
	-mv ${DIRECTORY_ROOT_CLIENT}.clang-format ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP} 2>/dev/null && echo -n "Backed up & "
	cp ${TEMPLATE_CLANG_FORMAT} ${DIRECTORY_ROOT_CLIENT}.clang-format
	echo "Synced!"
	echo -n "Backing up & Syncing clang-tidy Options ... "
	-mv ${DIRECTORY_ROOT_CLIENT}.clang-tidy ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP} 2>/dev/null && echo -n "Backed up & "
	cp ${TEMPLATE_CLANG_TIDY} ${DIRECTORY_ROOT_CLIENT}.clang-tidy
	echo "Synced!"
	echo -n "Backing up & Syncing The Pre-Commit Hook ... "
	-mv ${DIRECTORY_ROOT_CLIENT}.pre-commit-config.yaml ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP} 2>/dev/null && echo -n "Backed up & "
	cp ${TEMPLATE_CLANG_PRECOMMIT_HOOK} ${DIRECTORY_ROOT_CLIENT}.pre-commit-config.yaml
	echo "Synced!"
	echo -n "Backing up CMakeLists.txt & Deploying Template ... "
	-mv ${DIRECTORY_ROOT_CLIENT}CMakeLists.txt ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP} 2>/dev/null && echo -n "Backed up & "
	cp ${TEMPLATE_CMAKE_ROOT} ${DIRECTORY_ROOT_CLIENT}CMakeLists.txt
	echo "Synced!"
	echo -n "Backing up .gitignore & Deploying Template ... "
	-mv ${DIRECTORY_ROOT_CLIENT}.gitignore ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP} 2>/dev/null && echo -n "Backed up & "
	cp ${TEMPLATE_GITIGNORE} ${DIRECTORY_ROOT_CLIENT}CMakeLists.txt
	echo "Synced!"
	echo -n "Installing The Pre-Commit Hook ... "
	cd ${DIRECTORY_ROOT_CLIENT} && pre-commit install
	cd ${DIRECTORY_ROOT_CLIENT} && pre-commit install --hook-type pre-push
	echo "Done!"
	echo -n "Initializing Make Environment ... "
	mkdir -p ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	-mv ${DIRECTORY_ROOT_CLIENT}Makefile ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}${MAKEFILE_LOCAL} 2>/dev/null
	cp ${MAKEFILE_CLIENT} ${DIRECTORY_ROOT_CLIENT}Makefile
	echo "Done!"

# Refresh(1)
# 	WHEN: Execute this after Initialization in the boilerplate/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new boilerplate.mk to user directory for direct usage.
boilerplate-refresh:
	echo -n "Refreshing boilerplate-* Commands ... "
	cp ${MAKEFILE_DOTFILES} ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	echo "Done!"

# Update
# 	WHEN: Execute this if want to update submodule.
# 	WHAT: Move submodule to latest commit.
boilerplate-update:
	echo "Updating boilerplate Submodule:"
	cd ${DIRECTORY_ROOT_CLIENT} && git submodule update --init --remote ${PATH_SUBMODULE}
	echo "Done!"

# Activation
# 	WHEN: Execute after git cloning repository that uses submodule.
# 	WHAT: Fetch the bulk of the submodule.
# 		(*) This target will reset submodule to the version registered by
# 		the last commit, so if user wants to revert submodule version
# 		after Update but BEFORE commiting, this is their go-to.
boilerplate-activate:
	echo -n "Activating boilerplate Submodule ... "
	git submodule update --init
	echo "Done!"

# Deinitialization
# 	WHEN: Execute if want remove submodule usage from repository.
# 	WHAT:
# 		* Deletes ".clang-format" (or restores from backup)
# 		* Deletes ".clang-tidy" (or restores from backup)
# 		* Deletes ".pre-commit-config.yaml" (or restores from backup)
# 		* Deletes "CMakeLists.txt" (or restores from backup)
# 		* Uninstalls the .pre-commit-config.yaml as a git hook
# 		* Deletes "make/" directory;
# 		* Restores client's makefile;
# 		* Deletes the submodule.
boilerplate-deinit:
	echo -n "Deinitializing clang-format ... "
	rm ${DIRECTORY_ROOT_CLIENT}.clang-format # overwriting is optional, but deletion must be mandatory
	-mv ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}.clang-format ${DIRECTORY_ROOT_CLIENT}.clang-format 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Deinitializing clang-tidy ... "
	rm ${DIRECTORY_ROOT_CLIENT}.clang-tidy # overwriting is optional, but deletion must be mandatory
	-mv ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}.clang-tidy ${DIRECTORY_ROOT_CLIENT}.clang-tidy 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Deinitializing The Pre-Commit Hook ... "
	rm ${DIRECTORY_ROOT_CLIENT}.pre-commit-config.yaml # overwriting is optional, but deletion must be mandatory
	-mv ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}.pre-commit-config.yaml ${DIRECTORY_ROOT_CLIENT}.pre-commit-config.yaml 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Deinitializing CMakeList.txt ... "
	rm ${DIRECTORY_ROOT_CLIENT}CMakeLists.txt # overwriting is optional, but deletion must be mandatory
	-mv ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}CMakeLists.txt ${DIRECTORY_ROOT_CLIENT}CMakeLists.txt 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Deinitializing .gitignore ... "
	rm ${DIRECTORY_ROOT_CLIENT}.gitignore # overwriting is optional, but deletion must be mandatory
	-mv ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}.gitignore ${DIRECTORY_ROOT_CLIENT}.gitignore 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	echo -n "Removing Backup Directory ... "
	rmdir ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_BACKUP}
	echo "Done!"
	echo -n "Installing The Pre-Commit Hook ... "
	cd ${DIRECTORY_ROOT_CLIENT} && pre-commit uninstall
	cd ${DIRECTORY_ROOT_CLIENT} && pre-commit uninstall --hook-type pre-push
	echo "Done!"
	echo -n "Deinitializing Make Environment ..."
	rm ${DIRECTORY_ROOT_CLIENT}Makefile 	# overwriting is optional, but deletion must be mandatory
	-mv ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}${MAKEFILE_LOCAL} ${DIRECTORY_ROOT_CLIENT}Makefile 2>/dev/null && echo "Reverted!" || echo "Deleted!"
	rm -r ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	echo "Removing Submodule: "
	cd ${DIRECTORY_ROOT_CLIENT} && git submodule deinit -f ${PATH_SUBMODULE} && git rm ${DIRECTORY_ROOT_SUBMODULE} && echo "Done!"

# CMAKE: Retemplation
# 	WHEN: Execute after Initialization in the boilerplate/CPP/ directory.
# 		Execute this after Update introduced changes to CMakeLists-Root-Template.txt .
# 	What: Overwrites / Copies the CMakeLists-Root-Template.txt to client.
cmake-retemplate: 
	echo -n "Redeploying Template ... "
	cp ${TEMPLATE_CMAKE_ROOT} ${DIRECTORY_ROOT_CLIENT}CMakeLists.txt
	echo "Done!"

# CMAKE: Refresh(2):
# 	WHEN: Execute this after Initialization in the boilerplate/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new cmake.mk to user directory for direct usage.
cmake-refresh:
	echo -n "Refreshing cmake-* Commands ... "
	cp ${MAKEFILE_CMAKE} ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	echo "Done!"

# NCU: Activation
# 	WHEN: Execute after git cloning repository that uses submodule.
# 	WHAT: Copies section directory (solves hard-coded RO paths problem on NixOS).
ncu-activate:
	echo -n "Activating nsight-compute Section Directory ... "
	mkdir -p ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_NCU_CLIENT}
	cp ${DIRECTORY_NCU_BINARY}/sections/*.section ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_NCU_CLIENT}
	cp ${DIRECTORY_NCU_BINARY}/sections/*.py ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_NCU_CLIENT}
	echo "Done!"


# NCU: Deactivation
# 	WHEN: ??? want save space?
# 	WHAT: Deletes ncu section directory.
ncu-deactivate:
	echo -n "Deactivating nsight-compute Section Directory ... "
	rm -rf ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_NCU_CLIENT}
	echo "Done!"

# NCU: Refresh(3):
# 	WHEN: Execute this after Initialization in the boilerplate/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new ncu-compute.mk to user directory for direct usage.
ncu-refresh:
	echo -n "Refreshing ncu-* Commands ... "
	cp ${MAKEFILE_NCU} ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	echo "Done!"

# CLANG: Refresh(4):
# 	WHEN: Execute this after Initialization in the boilerplate/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new clang.mk to user directory for direct usage.
clang-refresh:
	echo -n "Refreshing clang-* Commands ... "
	cp ${MAKEFILE_CLANG} ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	echo "Done!"

# CLANG: Format Update
# 	WHEN: Execute this if want to update .clang-format .
# 	What: Overwrites / Copies the clang-format options to client.
clang-update-format:
	echo -n "Updating clang-format Options ... "
	cp ${TEMPLATE_CLANG_FORMAT} ${DIRECTORY_ROOT_CLIENT}.clang-format
	echo "Done!"

# CLANG: Tidy Update
# 	WHEN: Execute this if want to update .clang-tidy .
# 	What: Overwrites / Copies the clang-tidy options to client.
clang-update-tidy:
	echo -n "Updating clang-tidy Options ... "
	cp ${TEMPLATE_CLANG_TIDY} ${DIRECTORY_ROOT_CLIENT}.clang-tidy
	echo "Done!"

# CLANG: Hook Update
# 	WHEN: Execute this if want to update .pre-commit-config.yaml .
# 	What: Overwrites / Copies the .pre-commit-config.yaml template to client.
clang-update-hook:
	echo -n "Updating The Pre-Commit Hook ... "
	cp ${TEMPLATE_CLANG_PRECOMMIT_HOOK} ${DIRECTORY_ROOT_CLIENT}.pre-commit-config.yaml
	echo "Done!"

# CLANG: Hook Rehook
# 	WHEN: Execute this if want to reinstall .pre-commit-config.yaml as hook.
# 	What: Installs it via pre-commit.
clang-rehook:
	echo -n "Reinstalling The Pre-Commit Hook ... "
	cd ${DIRECTORY_ROOT_CLIENT} && pre-commit install >/dev/null
	cd ${DIRECTORY_ROOT_CLIENT} && pre-commit install --hook-type pre-push >/dev/null
	echo "Done!"

# GIT: Refresh(5):
# 	WHEN: Execute this after Initialization in the boilerplate/CPP/ directory.
# 		Execute this after every Update.
# 	WHAT: Copy new git.mk to user directory for direct usage.
git-refresh:
	echo -n "Refreshing git-* Commands ... "
	cp ${MAKEFILE_GIT} ${DIRECTORY_ROOT_CLIENT}${DIRECTORY_MAKE}
	echo "Done!"

# GIT : Gitignore Update
# 	WHEN: Execute this if want to update .gitignore .
# 	What: Overwrites / Copies the .gitignore template to client.
git-update-ignore:
	echo -n "Updating .gitignore ... "
	cp ${TEMPLATE_GITIGNORE} ${DIRECTORY_ROOT_CLIENT}.gitignore
	echo "Done!"
