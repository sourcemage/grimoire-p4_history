(

  ./configure  --build=$BUILD    \
               --prefix=/usr     &&
  make                           &&
  prepare_install                &&
  make    install                &&

  /bin/mv  /usr/bin/chgrp  /bin  &&
  /bin/mv  /usr/bin/chmod  /bin  &&
  /bin/mv  /usr/bin/chown  /bin  &&
  /bin/mv  /usr/bin/cp     /bin  &&
  /bin/mv  /usr/bin/dd     /bin  &&
  /bin/mv  /usr/bin/df     /bin  &&
  /bin/mv  /usr/bin/ln     /bin  &&
  /bin/mv  /usr/bin/ls     /bin  &&
  /bin/mv  /usr/bin/mkdir  /bin  &&
  /bin/mv  /usr/bin/mknod  /bin  &&
  /bin/mv  /usr/bin/mv     /bin  &&
  /bin/mv  /usr/bin/rm     /bin  &&
  /bin/mv  /usr/bin/rmdir  /bin  &&
  /bin/mv  /usr/bin/sync   /bin

) > $C_FIFO 2>&1
