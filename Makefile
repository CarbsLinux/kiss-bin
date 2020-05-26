PREFIX = /usr/local
BINDIR = ${PREFIX}/bin

all:
	@echo use 'make install'

install:
	mkdir -p ${DESTDIR}${BINDIR}
	cp -f kiss-bin ${DESTDIR}${BINDIR}/kiss-bin
	cp -f kiss-bin-manifest ${DESTDIR}${BINDIR}/kiss-bin-manifest
	chmod 755 ${DESTDIR}${BINDIR}/kiss-bin \
		${DESTDIR}${BINDIR}/kiss-bin-manifest

uninstall:
	rm -f ${DESTDIR}${BINDIR}/kiss-bin \
		${DESTDIR}${BINDIR}/kiss-bin-manifest
