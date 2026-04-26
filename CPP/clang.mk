.PHONY: clang-refresh clang-update-format
.SILENT:

SERVER_MAKEFILE_DIRECTORY=external/dotfiles/CPP/

clang-refresh:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-refresh

clang-update-format:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-update-format
