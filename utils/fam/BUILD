(

  patch  -p1  <  $SOURCE_CACHE/$SOURCE2  &&
  aclocal   &&
  autoconf  &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&

  # make install does some strange stuff, so do it by hand
  make  -C  fam      install  &&
  make  -C  include  install  &&
  make  -C  libfam   install  &&
  make  -C  man      install  &&

  (
    if  [  "$XINETD" = "y"  ];  then
      install  -m  755  $SCRIPT_DIRECTORY/fam  /etc/xinetd.d
      if  !  grep  -q  "^sgi_fam"  /etc/rpc;  then
        echo  "sgi_fam  391002  fam" >> /etc/rpc
      fi
    else
      source $SCRIPT_DIRECTORY/lib_runlevel
      installscript  fam.sh
    fi
  )

) > $C_FIFO 2>&1
