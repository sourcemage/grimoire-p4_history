(

  echo  CODA_SVR = $CODA_SVR
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&

  case $CODA_SVR  in
    y|Y)  echo  "Building coda server"
          make  server-install
          ;;
      *)  echo  "Building coda client"
          make  client-install
          ;;
  esac

) > $C_FIFO 2>&1
