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

  if  spell_installed  gpgme ;  then
    cd plugins/gaim-e/           &&
    sedit  "s:INSTALL_PATH=:INSTALL_PATH=/usr/lib/gaim:"  Makefile  &&
    make                         &&
    make install                 &&
    cd ../..
  fi

) > $C_FIFO 2>&1
