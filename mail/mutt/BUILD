(

  chmod  a+x  missing                           &&
  touch  README.UPGRADE                         &&
  ./configure  --build=$BUILD                   \
               --prefix=/usr                    \
               --sysconfdir=/etc                \
               --localstatedir=/var		\
               --enable-pop                     \
               --enable-imap                    \
               --with-mailpath=/var/spool/mail  \
               $OPTS                            &&
  make                                          &&
  prepare_install                               &&
  make    install                               &&
  ln  -sf mutt /usr/bin/mail                    &&
  ln  -sf mutt /usr/bin/mailx

) > $C_FIFO 2>&1
