(

	patch -p1 < $SCRIPT_DIRECTORY/nolocal.patch &&

	./configure                    \
		--build=$BUILD             \
		--prefix=/usr              \
		--sysconfdir=/etc          \
		--localstatedir=/var       \
		--disable-krb4             \
		--enable-shared            \
		--with-dbpath=/var/sasldb2 \
		--with-gnu-ld              \
		--with-dblib=berkeley      \
		$OPTS                      &&
	make                           &&
	prepare_install                &&
	make    install                &&

	mkdir -p /var/sasldb2

) > $C_FIFO 2>&1
