(

  if    grep      "^flags"  /proc/cpuinfo  |
        grep  -q  "mmx"
  then  ARCH="gcmmx"
  else  ARCH="linux"
  fi

  MAKEFILE="scripts/makefile.$ARCH"

  make   -f $MAKEFILE  prefix=/usr  &&    
  prepare_install                   &&
  make   -f $MAKEFILE  prefix=/usr  install

) > $C_FIFO 2>&1


