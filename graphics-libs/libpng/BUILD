#  if    grep      "^flags"  /proc/cpuinfo  |
#        grep  -q  "mmx"
#  then  ARCH="gcmmx"
#  else  ARCH="linux"
#  fi
ARCH=linux
MAKEFILE="scripts/makefile.$ARCH"
cp -f $MAKEFILE Makefile  &&
sedit  "s/-O3/$CFLAGS/;"                            Makefile  &&
sedit  "s:^prefix=.*$:prefix=${INSTALL_ROOT}/usr:"  Makefile  &&
sedit  's:$(prefix)/man:$(prefix)/share/man:'       Makefile  &&
make
