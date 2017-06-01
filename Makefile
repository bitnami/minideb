BUILD_DIR := build
MKDIR_P = mkdir -p
RM = rm -rf

.PHONY: build clean clobber

all: build

clean:
	${RM} ${CURDIR}/${BUILD_DIR}

clobber: clean
	@${RM} .installed-requirements

.installed-requirements:
	@echo "Installing required packages..."
	@./pre-build.sh
	@touch $@

build: .installed-requirements
	@echo "Building all supported distros..."
	@./buildall

%:
	@echo "Building $@..."
	@$(MAKE) .installed-requirements
	@${MKDIR_P} ${CURDIR}/${BUILD_DIR}
	./mkimage ${CURDIR}/${BUILD_DIR}/$@.tar $@

test-%:
	@cat ${CURDIR}/${BUILD_DIR}/$*.tar | docker import - minideb:$*
	@./test minideb:$*
