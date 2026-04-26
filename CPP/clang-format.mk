.PHONY: clang-format-refresh clang-format-config-update
.SILENT:

SERVER_MAKEFILE_DIRECTORY=external/dotfiles/CPP/

clang-format-refresh:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-format-refresh

clang-format-config-update:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-format-config-update
