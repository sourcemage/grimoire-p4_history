(

#  if    grep      "^flags"  /proc/cpuinfo  |
#        grep  -q  "mmx"
#  then  ARCH="gcmmx"
#  else  ARCH="linux"
#  fi
  ARCH=linux
  MAKEFILE="scripts/makefile.$ARCH"
  sed -i -e "s/-O3/$CFLAGS/;" $MAKEFILE &&
  make   -f $MAKEFILE  prefix=/usr  &&
  prepare_install                   &&
  make   -f $MAKEFILE  prefix=/usr  install

) > $C_FIFO 2>&1


