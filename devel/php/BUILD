(

  if    spell_installed  apache  ||
        spell_installed  apache-mod_ssl
  then  WITH_APACHE="--with-apxs"
  fi

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
	--enable-track-vars 		\
	--enable-safe-mode 		\
	--enable-sysvsem 		\
	--enable-sysvshm 		\
	--enable-force-cgi-redirect 	\
	--enable-trans-sid 		\
	--enable-yp 			\
	--enable-ftp 			\
	--enable-wddx 			\
	--enable-filepro		\
	--enable-dbase			\
	--with-regex=system 		\
	--with-versioning 		\
	--with-mod_charset 		\
	--with-layout=GNU		\
    --with-x-includes=/usr/X11/include  \
    --with-x-libraries=/usr/X11/lib  \
	$WITH_APACHE                  	\
 	$OPTS                         	&&
  make                                 	&&
  prepare_install                       &&
  make    install                       &&
  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi


) > $C_FIFO 2>&1
