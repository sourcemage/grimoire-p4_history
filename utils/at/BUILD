if [ ! -d /var/spool/atjobs ]; then
    mkdir  -p  /var/spool/atjobs
fi

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
source $SCRIPT_DIRECTORY/lib_runlevel

if [ -e /etc/init.d/functions ]; then
    installscript atd.sh
else
    install -m 755  $SCRIPT_DIRECTORY/atd.old.sh  $initdir/atd.sh
    ln     -sf  $initdir/atd.sh  /etc/rcS.d/S80atd
    ln     -sf  $initdir/atd.sh  /etc/rc0.d/K20atd
    ln     -sf  $initdir/atd.sh  /etc/rc6.d/K20atd
fi

  [  -e  /etc/at.deny  ]  ||  cp  at.deny   /etc

)
