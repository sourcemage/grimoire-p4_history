leave_config()  {
  if  [  -f  ${INSTALL_ROOT}/etc/pnm2ppa.conf  ];  then
    sedit  "s/^.*INSTALL.*pnm2ppa.conf.*$/#/"  Makefile
  fi
}

(
  sedit  "s:-O2 :$CFLAGS :"  Makefile                                                         &&
  sedit  "s:INSTALLDIR=/usr/local/bin:INSTALLDIR=${INSTALL_ROOT}/usr/bin:"  Makefile          &&
  sedit  "s:MANDIR=/usr/local/man/man1:MANDIR=${INSTALL_ROOT}/usr/share/man/man1:"  Makefile  &&

  make                                                                                        &&
  prepare_install                                                                             &&
  leave_config                                                                                &&
  make    install

) > $C_FIFO 2>&1
