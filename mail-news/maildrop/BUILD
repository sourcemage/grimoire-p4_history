(
 unset CFLAGS
 unset CXXFLAGS
 ./configure  --build=$BUILD        \
              --prefix=/usr         \
              --sysconfdir=/etc     \
              --localstatedir=/var  \
               $OPTS                 &&

  case  $MAILDIR  in
    y|Y|j|J)  sedit "s;/var/spool/mail;./Maildir/;" maildrop/config.h  ;;
  esac

  make                        &&
  prepare_install             &&

  make install 

) > $C_FIFO 2>&1
