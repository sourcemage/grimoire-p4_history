(

  case $IPV6 in
    y|Y) OPTS="$OPTS --enable-ipv6"
         ;;
  esac

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --disable-zvt         \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
