(

    sed -e '3119s/[^\n]*/#&/' -e '3120s/[^\n]*/#&/' $SOURCE_DIRECTORY/po/es.po > $SOURCE_DIRECTORY/po/es.tmp
    mv $SOURCE_DIRECTORY/po/es.tmp $SOURCE_DIRECTORY/po/es.po

    sed -e '2208s/[^\n]*/#&/' -e '2209s/[^\n]*/#&/' -e '3112s/[^\n]*/#&/' -e '3113s/[^\n]*/#&/' -e '5639s/[^\n]*/#&/' -e '5640s/[^\n]*/#&/' $SOURCE_DIRECTORY/po/pt_br.po > $SOURCE_DIRECTORY/po/pt_br.tmp 
    mv $SOURCE_DIRECTORY/po/pt_br.tmp $SOURCE_DIRECTORY/po/pt_br.po

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
