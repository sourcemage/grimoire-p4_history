(

  ln -sf /usr/share/automake-1.7/install-sh install-sh &&
  ln -sf /usr/share/automake-1.7/mkinstalldirs mkinstalldirs &&
  ln -sf /usr/share/automake-1.7/missing missing &&
  if ! test -f /usr/bin/python2 ; then ln -sf /usr/bin/python /usr/bin/python2; fi &&

  ./configure  --prefix=/usr/share/k3d               \
               --bindir=/usr/share/k3d               \
               --datadir=/usr/share/k3d              \
               $OPTS                                 &&
  make                                               &&
  prepare_install                                    &&
  make  install                                      &&
  install  -m  755  $SCRIPT_DIRECTORY/k3d  /usr/bin

)  >  $C_FIFO  2>&1
