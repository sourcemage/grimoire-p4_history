# $Id: BUILD,v 1.1 2002/07/17 00:44:55 sergeyli Exp $
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
