(
  if `httpd -v | grep -q "Apache/2\."`; then
    message "${MESSAGE_COLOR}Configuring for Apache 2.x${DEFAULT_COLOR}" &&
    WITH_APACHE="--with-apxs2"
  else
    message "${MESSAGE_COLOR}Configuring for Apache 1.x${DEFAULT_COLOR}" &&
    WITH_APACHE="--with-apxs"
  fi

  if    spell_installed  xfree86
  then  ARGS="$ARGS  --with-xpm-dir=/usr/X11R6"
  fi

	./buildconf &&
./configure \
	--prefix=/usr 			\
	--sysconfdir=/etc 		\
	--with-exec-dir=/usr/bin 	\
	--with-config-file-path=/etc  	\
	--disable-static 		\
	--disable-debug 		\
	--disable-rpath 		\
	--enable-inline-optimization 	\
	--enable-pic			\
	--enable-bcmath 		\
	--enable-magic-quotes 		\
	--enable-sysvsem 		\
	--enable-sysvshm 		\
	--enable-force-cgi-redirect 	\
	--enable-yp 			\
	--enable-ftp 			\
	--enable-wddx 			\
	--enable-filepro		\
	--enable-dbase			\
	--enable-sockets        \
	--enable-track-vars     \
	--enable-safe-mode      \
	--enable-trans-sid      \
	--with-regex=system 	\
	--with-versioning 		\
	--with-mod_charset 		\
	--with-layout=GNU		\
	--with-xmlrpc           \
	--with-zlib				\
    --with-x-includes=/usr/X11/include  \
    --with-x-libraries=/usr/X11/lib     \
	$WITH_APACHE                  	    \
 	$OPTS                               &&
  make                                 	&&
  prepare_install                       &&
  make    install                       &&
  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi


) > $C_FIFO 2>&1
