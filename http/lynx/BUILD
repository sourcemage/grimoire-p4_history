(

  mkdir  -p  /var/lib/lynx

  ./configure   --host=$BUILD                        \
                --prefix=$INSTALL_ROOT/usr                        \
                --libdir=$INSTALL_ROOT/var/lib/lynx               \
                --sysconfdir=$INSTALL_ROOT/etc                    \
                $OPTS                                &&
  make                                               &&
  prepare_install                                    &&
  make    install                                    &&
  make    install-help                               &&
  make    install-doc                                &&
  ln    -sf  ../var/lib/lynx/lynx.cfg $INSTALL_ROOT/etc/lynx.cfg  &&
  rm    -f  $INSTALL_ROOT/usr/bin/lynx.old

) > $C_FIFO 2>&1
