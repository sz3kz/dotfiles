.PHONY: clang-format-refresh clang-format-format clang-format-config-update
FILE ?=

SERVER_MAKEFILE_DIRECTORY=external/dotfiles/CPP/

clang-format-refresh:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-format-refresh

clang-format-format:
	@if [ -z "$(FILE)" ]; then \
		echo "Error: Please specify a file using 'make clang-format-format FILE=<FILENAME.CPP>"; \
		exit 1; \
	fi
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-format-format CLANG_FORMAT_TARGET_FILE=${FILE}

clang-format-config-update:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make clang-format-config-update
