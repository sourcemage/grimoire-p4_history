(
	# make fcgi.py located in pylib/ and visible to web2ldap
	cp $SCRIPT_DIRECTORY/fcgi.py ./pylib/ &&
	patch -p1 < $SCRIPT_DIRECTORY/import.patch &&

	# change defaults
	sedit 's|web2ldaprun|nobody|' \
		./etc/web2ldap/web2ldapcnf/standalone.py &&
	sedit 's|/tmp/fcgi/web2ldap-fastcgi.pid|/var/run/web2ldap-fastcgi.pid|' \
		./etc/web2ldap/web2ldapcnf/fastcgi.py &&

	# make stylesheets accessible from the web
	ln -s ../htdocs/css fcgi/css &&
	sedit 's|/css/|./css/|' ./etc/web2ldap/web2ldapcnf/misc.py &&

	python  ./sbin/compile.py  &&
	prepare_install            &&
	mkdir -p /usr/share/$SPELL &&

	# do NOT force copy here because configuration is in
	# the $SOURCE_DIRECTORY/etc -> /usr/share/$SPELL/etc
	cp -R ./ /usr/share/$SPELL/

) > $C_FIFO 2>&1
