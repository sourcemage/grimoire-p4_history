(

  DEFAULT_CFLAGS="CFLAGS    = -O3 -fomit-frame-pointer -Wall"
       SA_CFLAGS="CFLAGS    = $CFLAGS  -Wall"

  sedit  "s/$DEFAULT_CFLAGS/$SA_CFLAGS/"  Makefile.rules

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1 && (


  if  [  !  -f   /etc/modules.d/autofs  ];  then
    mkdir   -p   /etc/modules.d
    cp           $SCRIPT_DIRECTORY/modules.d/*  /etc/modules.d
  fi

  MOD="/etc/modules.conf"
  INC="include  /etc/modules.d/autofs"

  grep    -q  "$INC"      $MOD  ||
  echo        "$INC"  >>  $MOD
  depmod  -a

  for  FILE  in  auto.home auto.master auto.misc
  do  [  -f  /etc/$FILE ]  ||  cp  $SCRIPT_DIRECTORY/$FILE  /etc
  done

  cp  $SCRIPT_DIRECTORY/autofs.sh  /etc/init.d/autofs
 
  ln     -sf  ../init.d/autofs     /etc/rcS.d/S80autofs

  ln     -sf  ../init.d/autofs     /etc/rc0.d/K20autofs
  ln     -sf  ../init.d/autofs     /etc/rc6.d/K20autofs

)
