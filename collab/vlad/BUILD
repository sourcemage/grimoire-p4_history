# $Id: BUILD,v 1.1 2002/07/16 23:26:12 sergeyli Exp $
(

	patch -p1 < $SCRIPT_DIRECTORY/LDAPv3.patch &&

	./configure              \
		--build=$BUILD       \
		--prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		$OPTS                &&
	make                     &&
	prepare_install          &&
	make    install

) > $C_FIFO 2>&1
