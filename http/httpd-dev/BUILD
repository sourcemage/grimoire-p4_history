(

  # these modules are not enabled by default and not part of any dependency
  ENABLE_MODULES=$(cat $SCRIPT_DIRECTORY/enable-modules | while read m; do echo -n " --enable-$m=shared"; done) &&

  # Bring mod_proxy_http to the 2.0.47's version because the one in HEAD
  # produces weird errors for me in reverse proxy mode
# patch -p1 -R < $SCRIPT_DIRECTORY/mod_proxy_http.diff &&

  ./configure                         \
    --prefix=/usr                     \
    --sysconfdir=/etc/httpd           \
    --localstatedir=/var              \
    --with-mpm=${APACHE_MPM:=prefork} \
    --enable-layout=GNU               \
    --enable-so=static                \
    --enable-mods-shared=all          \
    $ENABLE_MODULES                   \
    $OPTS                             &&
  make                                &&
  prepare_install                     &&
  make    install

) >$C_FIFO 2>&1 && (

  ln -nsf /usr/sbin/envvars /usr/bin/envvars
  ln -nsf /usr/sbin/httpd   /usr/bin/httpd

)
