.PHONY: git-refresh git-update-ignore git-rehook git-update-hook
.SILENT:

SERVER_MAKEFILE_DIRECTORY=external/boilerplate/CPP/

git-refresh:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make git-refresh

git-update-ignore:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make git-update-ignore

git-update-hook:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make git-update-hook

git-rehook:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make git-rehook
