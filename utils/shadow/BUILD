(
#  Every new version of shadow arrives with bugs.  :(
  sedit  "s/-lpam_misc/-lpam_misc -lpam/"  configure
  sedit  "s/ln -s/ln -sf/g"  configure
  sedit  "s/ln -s/ln -sf/g"  aclocal.m4

  # Do not compile/install su, coreutils provides that
  # Bug #4008
  patch  -p1  <  ${SCRIPT_DIRECTORY}/su.patch  &&

  # change MD5_CRYPT_ENAB  to yes
  sedit "s:#MD5_CRYPT_ENAB.*$:MD5_CRYPT_ENAB  yes:g" etc/login.defs.linux &&

  ./configure  --build=$BUILD        \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  && (

  cd  etc

  [  -e  ${INSTALL_ROOT}/etc/limits           ]  \
  ||  cp  limits            ${INSTALL_ROOT}/etc
  [  -e  ${INSTALL_ROOT}/etc/login.access     ]  \
  ||  cp  login.access      ${INSTALL_ROOT}/etc
  [  -e  ${INSTALL_ROOT}/etc/login.defs.linux ]  \
  ||  cp  login.defs.linux  ${INSTALL_ROOT}/etc
  [  -e  ${INSTALL_ROOT}/etc/login.defs       ]  \
  ||  cp  login.defs.linux  ${INSTALL_ROOT}/etc/login.defs
  [  -e  ${INSTALL_ROOT}/etc/default          ]  \
  ||  mkdir                 ${INSTALL_ROOT}/etc/default

  cp  $SCRIPT_DIRECTORY/adduser  ${INSTALL_ROOT}/usr/sbin  &&
  cp  $SCRIPT_DIRECTORY/deluser  ${INSTALL_ROOT}/usr/sbin

)
