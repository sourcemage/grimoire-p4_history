(

if [ "$CVS" = "yes" ]; then
     sedit "s/root//" autogen.sh
     ./autogen.sh  &&
     default_build
else
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc/imlib2    \
               $OPTS                       &&
  sedit  's/-lImlib2//'  loaders/Makefile  &&
  make                                     &&
  prepare_install                          &&
  make    install
fi

) > $C_FIFO 2>&1
