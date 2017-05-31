BIND_DIR := build
MKDIR_P = mkdir -p
RM = rm -rf

default: build-all

build-jessie:
	$(MAKE) clean-up
	${MKDIR_P} ${CURDIR}/${BIND_DIR}
	./pre-build.sh
	./mkimage ${CURDIR}/${BIND_DIR}/jessie.tar jessie

build-all:
	$(MAKE) clean-up
	./pre-build.sh
	./buildall

test-jessie:
	cat ${CURDIR}/${BIND_DIR}/jessie.tar | docker import - minideb:jessie
	./test minideb:jessie

clean-up:
	${RM} ${CURDIR}/${BIND_DIR}
