(

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  cd  thedocs                        &&
  cp  -r  css/css    css/css.docrc     /usr/share/apps/quanta/doc  &&
  cp  -r  html/html  html/html.docrc   /usr/share/apps/quanta/doc  &&
  cp  -r  php/php    php/php.docrc     /usr/share/apps/quanta/doc  &&
  cp  -r  javascript/javascript        /usr/share/apps/quanta/doc  &&
  cp  -r  javascript/javascript.docrc  /usr/share/apps/quanta/doc

) > $C_FIFO 2>&1
