(

  make  TCP
  install  -m 755  NPtcp      /usr/bin
  install  -m 644  netpipe.1  /usr/man/man1

  if spell_installed mpich
  then
    sedit  "s/MPI_ARCH   =.*$/MPI_ARCH   =LINUX/"  Makefile
    sedit  "s/-lmpi/-lmpich/"  Makefile
    make  MPI
    install  -m 755  NPmpi    /usr/bin
  fi 
 
  if spell_installed pvm
  then
    make  PVM
    install  -m 755  NPpvm    /usr/bin
  fi

) > $C_FIFO 2>&1

