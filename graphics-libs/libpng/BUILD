(

  if    grep      "^flags"  /proc/cpuinfo  |
        grep  -q  "mmx"
  then  ARCH="gcmmx"
  else  ARCH="linux"
  fi

  MAKEFILE="scripts/makefile.$ARCH"

  patch -p1 < "$SPELL_DIRECTORY/libpng-1.2.5-can-2004-0421.patch" &&
  make   -f $MAKEFILE  prefix=/usr  &&    
  prepare_install                   &&
  make   -f $MAKEFILE  prefix=/usr  install

) > $C_FIFO 2>&1


