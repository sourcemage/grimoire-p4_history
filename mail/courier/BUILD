(

  LDFLAGS=${LDFLAGS//-z combreloc/}                                      &&

  ./configure                                                            \
               --prefix=/usr                                             \
               --datadir=/usr/share/courier                              \
               --sysconfdir=/etc/courier                                 \
               --localstatedir=/var/courier                              \
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
#  mkdir   -p  /usr/share/courier                                         &&
  make    install                                                        &&
  make    install-configure

  if  [  "${AUTHPAM}"  ==  "y"  ];  then
    cp  $SCRIPT_DIRECTORY/pam.d/*  /etc/pam.d
  fi

)  >  $C_FIFO  2>&1
