(

  # remove APR and APU and reconfigure to use external ones
  rm -fr srclib/apr*/ &&
  patch -p1 < $SCRIPT_DIRECTORY/build.diff &&
  ./buildconf --with-apr=/usr/share/apache2 --with-apr-util=/usr/share/apache2 &&

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/httpd \
    --localstatedir=/var \
    --enable-layout=GNU \
    --enable-modules=most,max \
    $OPTS &&
  make &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1 && (

  ln -s /usr/sbin/envvars /usr/bin/envvars
  ln -s /usr/sbin/httpd /usr/bin/httpd

)
