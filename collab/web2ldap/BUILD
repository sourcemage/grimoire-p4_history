# $Id: BUILD,v 1.3 2002/12/11 19:39:43 sergeyli Exp $
(
	cp $SCRIPT_DIRECTORY/fcgi.py ./pylib/ &&
	patch -p1 < $SCRIPT_DIRECTORY/fcgi.patch &&
	sedit 's|web2ldaprun|nobody|' \
		./etc/web2ldap/web2ldapcnf/standalone.py &&
	sedit 's|/tmp/fcgi/web2ldap-fastcgi.pid|/var/run/web2ldap-fastcgi.pid|' \
		./etc/web2ldap/web2ldapcnf/fastcgi.py &&

	python  ./sbin/compile.py  &&
	prepare_install            &&
	mkdir -p /usr/share/$SPELL &&

	# do NOT force copy here because configuration is in
	# the $SOURCE_DIRECTORY/etc -> /usr/share/$SPELL/etc
	cp -R ./ /usr/share/$SPELL/

) > $C_FIFO 2>&1
