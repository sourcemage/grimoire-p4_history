(
  create_account  scanlogd

  sedit  "s:/usr/local/:/usr/:"   		Makefile	&&
  sedit  "s:\-O2:$CFLAGS:"			Makefile	&&
  sedit  "s:/usr/include/pcap:/usr/include:"	Makefile	&&

  make  libnids		&&

  prepare_install	&&

  cp  scanlogd.8  /usr/share/man/man8/scanlogd.8	&&
  cp  scanlogd	  /usr/sbin/scanlogd

) > $C_FIFO 2>&1
