(

  LDFLAGS=${LDFLAGS//-z combreloc/}                                      &&

#  patch  -p0  <  ${SCRIPT_DIRECTORY}/disable-root-check.patch            &&

  ./configure                                                            \
               --prefix=${INSTALL_ROOT}/usr                              \
               --datadir=${INSTALL_ROOT}/usr/share/courier               \
               --sysconfdir=${INSTALL_ROOT}/etc/courier                  \
               --localstatedir=${INSTALL_ROOT}/var/courier               \
               --disable-root-check                                      \
               --with-mailuser=courier                                   \
               --with-mailgroup=courier                                  \
               --with-shellpath=${PATH}                                  \
               ${OPTS}                                                   &&

  sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/config.log     &&
  sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/config.status  &&
  sedit  "s:-z combreloc::g"  ${SOURCE_DIRECTORY}/authlib/Makefile       &&

  make                                                                   &&
  prepare_install                                                        &&
#  mkdir   -p  ${INSTALL_ROOT}/usr/share/courier                          &&
  make    install                                                        &&
  make    install-configure

  if  [  "${AUTHPAM}"  ==  "y"  ];  then
    cp  ${SCRIPT_DIRECTORY}/pam.d/*  ${INSTALL_ROOT}/etc/pam.d
  fi

)  >  $C_FIFO  2>&1
