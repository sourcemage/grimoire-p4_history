(

  echo "If you're upgrading, please dispel sdp-libs before !!!!" &&
  ./configure  --prefix=/usr/share/k3d               \
               --bindir=/usr/share/k3d               \
               --datadir=/usr/share/k3d              \
               $OPTS                                 &&
  make                                               &&
  prepare_install                                    &&
  make  install                                      &&
  cp  $SCRIPT_DIRECTORY/k3d  /usr/bin

) > $C_FIFO 2>&1
