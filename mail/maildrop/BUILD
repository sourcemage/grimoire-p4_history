 unset CFLAGS
 unset CXXFLAGS
 ./configure  --build=$BUILD             \
              --prefix=/usr              \
              --sysconfdir=/etc          \
              --infodir=/usr/share/info  \
              --mandir=/usr/share/man    \
              --localstatedir=/var       \
               $OPTS                     &&

  if [ "$MAILDIR" == "y" ];then
    sedit "s;/var/spool/mail;./Maildir/;" maildrop/config.h
  fi

  make
