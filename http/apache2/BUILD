(

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/httpd \
    --localstatedir=/var \
    --enable-layout=GNU \
    --enable-modules=most,max \
    --enable-info \
    --enable-cgi \
    $OPTS &&
  make &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1 && (

  ln -s /usr/sbin/envvars /usr/bin/envvars
  ln -s /usr/sbin/httpd /usr/bin/httpd
  mkdir -p /var/run/httpd

)
