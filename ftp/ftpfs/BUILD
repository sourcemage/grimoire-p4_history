(

  KERNEL=`installed_version  linux`

  cp  ftpfs/Makefile  ftpfs/Makefile.old
  sed  "s/\$(shell uname -r)/$KERNEL/"  \
       ftpfs/Makefile.old  >  ftpfs/Makefile

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
