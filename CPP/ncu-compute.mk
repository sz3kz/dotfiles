.PHONY: ncu-activate ncu-deactivate ncu-refresh 

SERVER_MAKEFILE_DIRECTORY=external/dotfiles/CPP/

ncu-activate:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make dotfiles-activate

ncu-deactivate:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make dotfiles-deactivate

ncu-refresh:
	cd ${SERVER_MAKEFILE_DIRECTORY} && make dotfiles-refresh
