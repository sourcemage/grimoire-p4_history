(

  # these modules are not enabled by default and not part of any dependency
  ENABLE_MODULES=$(cat $SCRIPT_DIRECTORY/enable-modules | while read m; do echo -n " --enable-$m=shared"; done) &&

  ./buildconf                         &&
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
  mkdir -p /var/run/httpd

)
