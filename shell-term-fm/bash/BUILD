(

  if    [  -x  /bin/bash.dynamic  ]
  then  mv     /bin/bash.dynamic  /bin/bash;  rm  -f  /bin/bash.static
  elif  [  -x  /bin/bash.static   ]
  then  mv     /bin/bash.static   /bin/bash;  rm  -f  /bin/bash.dynamic
  fi

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --bindir=/bin         \
               $OPTS                 &&
  make                               &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  cp  -f   bash     /bin
  cp  -f   bashbug  /bin
  ln  -sf  bash     /bin/sh

  cd  doc

  for  MANPAGE  in  `ls  *.1`;  do
    gzip  -9  $MANPAGE
    cp  $MANPAGE.gz  /usr/man/man1
  done

  cp  bashref.info  /usr/info/bash.info
  install-info  --info-dir=/usr/info  /usr/info/bash.info

)
