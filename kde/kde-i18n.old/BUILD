(

  for  LOCALE  in  $KDE_I18N_LOCALES;  do
    cd $BUILD_DIRECTORY/$SPELL-$LOCALE
    ./configure  --build=$BUILD        \
                 --prefix=/usr         \
                 --sysconfdir=/etc     \
                 --localstatedir=/var  \
                 $OPTS                 &&
    make
  done

  prepare_install

  for  LOCALE  in  $KDE_I18N_LOCALES;  do
    cd $BUILD_DIRECTORY/$SPELL-$LOCALE
    make  install
  done

) > $C_FIFO 2>&1
