do_configure() {
	cd ${PN}-${PV}
	./configure --prefix=/usr		\
	    --host=arm-none-linux-gnueabi	\
#	    --build=i686-pc-linux-gnu		\
	    LDFLAGS=-L${STAGING}/usr/lib		\
	    CPPFLAGS=-I${STAGING}/usr/include	\
}

do_compile() {
	cd ${PN}-${PV}
	make
}

do_staging[dirs] = "${STAGING}"

do_staging() {
	mkdir -p ${STAGING}/usr
	cp -rf ${D}/usr/lib ${D}/usr/include ${STAGING}/usr
}

do_install() {
	cd ${PN}-${PV}
	make install DESTDIR=${D}
}
