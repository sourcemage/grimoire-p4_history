(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&

sedit "s/"cx"/"dx"/g" src/engine/i386.c
sedit "s/penium/pentium/" src/engine/i386.c

make  all                                   &&
prepare_install                             &&
make install                                

) > $C_FIFO 2>&1
