  # gcc 3.4 fix
  sedit  "s:extern char://extern char:"  libmisc/xmalloc.c

#  Every new version of shadow arrives with bugs.  :(
  sedit  "s/-lpam_misc/-lpam_misc -lpam/"  configure
  sedit  "s/ln -s/ln -sf/g"  configure
  sedit  "s/ln -s/ln -sf/g"  aclocal.m4

  # Do not compile/install su, coreutils provides that
  # Bug #4008
  patch  -p1  <  ${SCRIPT_DIRECTORY}/su.patch  &&

  # change MD5_CRYPT_ENAB  to yes
  sedit "s:#MD5_CRYPT_ENAB.*$:MD5_CRYPT_ENAB  yes:g" etc/login.defs.linux &&

  default_build
#  ./configure  --build=$BUILD        \
#               --prefix=${INSTALL_ROOT}/usr         \
#               --sysconfdir=${INSTALL_ROOT}/etc     \
#               --localstatedir=${INSTALL_ROOT}/var  \
#               $OPTS                 &&
#  make
