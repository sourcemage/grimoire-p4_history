(

  sedit  "s:db3/db.h:db.h:"  configure
  sedit  "s:db3/db.h:db.h:"  configure.in
  
  if    [  "$( installed_version db  |  cut  -c1  )"  ==  "4"  ]
  then  sedit  "s/3.3/4.0/g"  configure
        sedit  "s/3.3/4.0/g"  configure.in
  fi

  ./configure  --prefix=/usr            \
               --sysconfdir=/etc        &&
  make                                  &&
  prepare_install                       &&
  make    install                       &&
  if  [  !  -f  /etc/gconf/1/path  ];  then
    mv  /etc/gconf/1/path.example  /etc/gconf/1/path
  fi

) > $C_FIFO 2>&1
