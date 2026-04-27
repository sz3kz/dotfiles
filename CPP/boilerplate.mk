.PHONY: boilerplate-activate boilerplate-update boilerplate-deinit boilerplate-refresh boilerplate-check-prerequesites
.SILENT:

REPOSITORY_ROOT_DIRECTORY=external/boilerplate/
LANGUAGE_DIRECTORY=CPP/

boilerplate-activate:
	git submodule update --init
	cd ${REPOSITORY_ROOT_DIRECTORY} && git sparse-checkout init --cone
	cd ${REPOSITORY_ROOT_DIRECTORY} && git sparse-checkout set ${LANGUAGE_DIRECTORY}

boilerplate-update:
	cd ${REPOSITORY_ROOT_DIRECTORY}${LANGUAGE_DIRECTORY} && make boilerplate-update

boilerplate-deinit:
	cd ${REPOSITORY_ROOT_DIRECTORY}${LANGUAGE_DIRECTORY} && make boilerplate-deinit

boilerplate-refresh:
	cd ${REPOSITORY_ROOT_DIRECTORY}${LANGUAGE_DIRECTORY} && make boilerplate-refresh

boilerplate-check-prerequesites:
	cd ${REPOSITORY_ROOT_DIRECTORY}${LANGUAGE_DIRECTORY} && make boilerplate-check-prerequesites
