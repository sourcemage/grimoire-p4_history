(

  ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  cd  thedocs                        &&
  cp  -r  css/css    css/css.docrc     ${INSTALL_ROOT}/usr/share/apps/quanta/doc  &&
  cp  -r  html/html  html/html.docrc   ${INSTALL_ROOT}/usr/share/apps/quanta/doc  &&
  cp  -r  php/php    php/php.docrc     ${INSTALL_ROOT}/usr/share/apps/quanta/doc  &&
  cp  -r  javascript/javascript        ${INSTALL_ROOT}/usr/share/apps/quanta/doc  &&
  cp  -r  javascript/javascript.docrc  ${INSTALL_ROOT}/usr/share/apps/quanta/doc

) > $C_FIFO 2>&1
