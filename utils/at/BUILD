if [ ! -d /var/spool/atjobs ]; then
    mkdir  -p  /var/spool/atjobs
fi

SENDMAIL='#define  SENDMAIL  "/usr/sbin/sendmail"'

(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --bindir=/bin         \
               --sbindir=/sbin       \
               $OPTS                 &&
  echo  "$SENDMAIL"  >>  config.h    &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  &&  ( 

  [  -e  /etc/at.deny  ]  ||  cp  at.deny   /etc

)
