(

  case $PANEL in
    y|Y) OPTS="$OPTS --enable-panel"
         ;;
  esac

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&

  case $GAIM_E in
   y|Y) cd plugins/gaim-e/           &&
        make                         &&
        make install                 &&
        cd ../..
        ;;
  esac 

) > $C_FIFO 2>&1
