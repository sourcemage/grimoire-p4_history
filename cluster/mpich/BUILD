(
  patch -p1 < $SCRIPT_DIRECTORY/mpich-1.2.4.patch  &&
  ./configure  --prefix=/usr                       \
               --sysconfdir=/etc/mpich             &&
  make                                             &&
  make   install
 
) > $C_FIFO 2>&1

