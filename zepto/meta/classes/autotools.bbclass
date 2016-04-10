do_configure() {
	cd ${PN}-${PV}
	./configure --prefix=/usr		\
	    --host=arm-none-linux-gnueabi	\
#	    --build=i686-pc-linux-gnu		\
	    LDFLAGS=-L${D}/usr/lib		\
	    CPPFLAGS=-I${D}/usr/include	\
}

do_compile() {
	cd ${PN}-${PV}
	make
}

do_install() {
	cd ${PN}-${PV}
	make install DESTDIR=${D}
}
