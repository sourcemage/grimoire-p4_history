(

  bzcat  $SCRIPT_DIRECTORY/Makefile.diff.bz2  |  patch  -p0  &&

  ./configure  --build=$BUILD        \
               --prefix=/usr/X11R6   \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --enable-themes       \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                  

) > $C_FIFO 2>&1
