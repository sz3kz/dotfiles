.PHONY: clang-refresh clang-update-format clang-update-tidy clang-rehook
.SILENT:

SERVER_MAKEFILE_DIRECTORY=external/boilerplate/CPP/

clang-refresh:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-refresh

clang-update-format:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-update-format

clang-update-tidy:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-update-tidy

clang-rehook:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-rehook
