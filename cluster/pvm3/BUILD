(
  INSTALLDIR="/usr/share/${SPELL}"        &&
  export  PVM_ROOT=$INSTALLDIR            &&

  cp  -r  $SOURCE_DIRECTORY  /usr/share   &&
  cd      /usr/src                        &&
  cd      $INSTALLDIR                     &&
  make                                    &&

  for  i  in  `ls  $INSTALLDIR/man/man1`
  do
    if [  -h  /usr/man/man1/$i  ] ;  then  \
      rm  -f  /usr/man/man1/$i;
    fi
    ln  -s  $INSTALLDIR/man/man1/$i       \
      /usr/man/man1/$i
  done                                    &&

  for  i  in  `ls  $INSTALLDIR/man/man3`
  do
    if  [  -h  /usr/man/man3/$i  ] ;  then  \
      rm  -f  /usr/man/man3/$i;
    fi
    ln  -s  $INSTALLDIR/man/man3/$i       \
      /usr/man/man3/$i
  done                                    &&

  if  [  -f  /usr/bin/pvm  ] ;  then
    rm  -f  /usr/bin/pvm
  fi

  if  [  -f  /usr/bin/pvmd  ] ;  then
    rm  -f  /usr/bin/pvmd
  fi

  ln  -s  $INSTALLDIR/lib/pvm   /usr/bin  &&
  ln  -s  $INSTALLDIR/lib/pvmd  /usr/bin  &&

  sedit  's/\$HOME\/pvm3/\/usr\/share\/pvm3/'  /usr/bin/pvm   &&
  sedit  's/\$HOME\/pvm3/\/usr\/share\/pvm3/'  /usr/bin/pvmd

) > $C_FIFO 2>&1
