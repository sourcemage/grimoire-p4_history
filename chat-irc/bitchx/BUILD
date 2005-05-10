  #  the following export was to deal with a zvt compilation problem.
  export  CFLAGS="-I/usr/include/gnome-1.0"
invoke_gcc
  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --without-gtk      \
               $OPTS              &&
  make
