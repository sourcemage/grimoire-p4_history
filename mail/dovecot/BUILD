(

  if spell_installed openssl; then
    SSL="--with-ssl=openssl"							&&
    mkdir -p /etc/ssl/certs							&&
    mkdir -p /etc/ssl/private
  else
    SSL=" "
  fi										&&

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var 		\
             --disable-ipv6 $SSL	 					&&
  make										&&

  prepare_install								&&

  make install								        &&

  cp $SCRIPT_DIRECTORY/dovecot-example.conf /etc				&&
  mkdir -p /usr/doc/$SPELL							&&
  cp doc/* /usr/doc/$SPELL/							&&	 
  cp /usr/doc/$SPELL/dovecot-openssl.cnf /etc					&&
  $SCRIPT_DIRECTORY/mkcert.sh							&&

  if [ -e /etc/init.d/dovecot.sh ]; then
    CUR_DATE=`date +%y.%m.%d-%H.%M.%S`						&&
    mv /etc/init.d/dovecot.sh /etc/init.d/dovecot.sh-$CUR_DATE
  fi										&&
  cp  $SCRIPT_DIRECTORY/dovecot.sh  /etc/init.d/				&&
  ln  -sf  ../init.d/dovecot.sh     /etc/rc3.d/S90dovecot			&&
  ln  -sf  ../init.d/dovecot.sh     /etc/rc4.d/S90dovecot			&&
  ln  -sf  ../init.d/dovecot.sh     /etc/rc5.d/S90dovecot			&&

  ln  -sf  ../init.d/dovecot.sh     /etc/rc0.d/K10dovecot			&&
  ln  -sf  ../init.d/dovecot.sh     /etc/rc6.d/K10dovecot

) > $C_FIFO 2>&1 
