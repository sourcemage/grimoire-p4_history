mkdir  -p  /var/spool/atjobs

SENDMAIL='#define  SENDMAIL  "/usr/sbin/sendmail"'

(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  echo  "$SENDMAIL"  >>  config.h    &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  &&  ( 

  cp  $SCRIPT_DIRECTORY/atd.sh  /etc/init.d
  ln     -sf  ../init.d/atd.sh  /etc/rcS.d/S80atd
  ln     -sf  ../init.d/atd.sh  /etc/rc0.d/K20atd
  ln     -sf  ../init.d/atd.sh  /etc/rc6.d/K20atd

  [  -e  /etc/at.deny  ]  ||  cp  at.deny   /etc

)
