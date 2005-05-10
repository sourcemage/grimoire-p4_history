(

  if [ "$ARCH_SPECIFIC" == "y" ]; then
    sedit "s#CFLAGS = -s -static -Wall -O3#CFLAGS = -s -static -Wall -O3 $CFLAGS#" Makefile 	&&
    sedit "s/#LINKFLAGS = -s/LINKFLAGS = $LDFLAGS/" Makefile					
  fi												&&

  make                            								&&
  prepare_install                 								&&
  
  cp nbench /usr/sbin/nbench 									&&
  cp pointer /usr/sbin/nbench-pointer 								&&
  cp sysinfo.sh /usr/sbin/nbench-sysinfo.sh							&&

  mkdir -p /usr/doc/$SPELL									&&
  cp bdoc.txt /usr/doc/$SPELL

) > $C_FIFO 2>&1
