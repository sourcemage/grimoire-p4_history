(

  export    CFLAGS="$CFLAGS -I/usr/include/freetype2"
  export  CXXFLAGS="$CFLAGS"

#  if  spell_installed  freetype2;
#  then
#    OPTS='$OPTS --with-freetype2-includes=/usr/include/freetype2'
#  fi

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&

  make                                   &&
  prepare_install                        &&
  make    install

) > $C_FIFO 2>&1
