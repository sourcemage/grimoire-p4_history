( 

  AMAKEV=`installed_version  automake  |  cut  -f  1,2  -d  .`

  rm  -f  install-sh  missing  mkinstalldirs           &&
  ln  -s  /usr/share/automake-${AMAKEV}/install-sh     &&
  ln  -s  /usr/share/automake-${AMAKEV}/missing        &&
  ln  -s  /usr/share/automake-${AMAKEV}/mkinstalldirs  &&

  ./autogen.sh  --build=$BUILD        \
                --prefix=/usr         \
                --sysconfdir=/etc     \
                --localstatedir=/var  \
                $OPTS                 &&
  make                                && 
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1
