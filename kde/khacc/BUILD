(
# fix bug in 1.7.6 config script
  sedit "s:/local::" configure.in	&&
  aclocal				&&
  automake				&&
  autoconf				&&
  default_build

) > $C_FIFO 2>&1
