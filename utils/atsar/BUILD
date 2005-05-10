(

  sedit  "s/-DWEBSUPPORT/-DWEBSUPPORT $CFLAGS/"  Makefile 
  sedit  "s/local\///"   scripts/atsa1 
  sedit  "s/local\///"   include/atsar.h 

  make                   &&
  prepare_install        &&

  mkdir  /var/log/atsar  &&

#  needed only for FTP and HTTP accounting
#
#  cp atsar_linux.conf  /etc/atsar.conf    &&
#  cp scripts/atsaftp   /usr/bin/atsaftp   &&
#  cp scripts/atsahttp  /usr/bin/atsahttp  &&

  cp atsar/atsar       /usr/bin/atsar     &&
  cp atsadc/atsadc     /usr/bin/atsadc    &&

  cp scripts/atsa1     /usr/bin/atsa1     &&
  cp man/*             /usr/man/man1 

) > $C_FIFO 2>&1
