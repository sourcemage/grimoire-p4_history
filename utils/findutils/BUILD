(
  ./configure   --build=${BUILD}                                 \
                --host=${HOST}                                   \
                --prefix=${INSTALL_ROOT}/usr                     \
                --libexecdir=${INSTALL_ROOT}/usr/bin             \
                --sysconfdir=${INSTALL_ROOT}/etc     		 \
                --localstatedir=${INSTALL_ROOT}/var/cache        \
                $OPTS				   &&
   make                                            &&
   prepare_install                                 &&
   make  install

) > $C_FIFO 2>&1
