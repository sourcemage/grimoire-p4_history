  sedit "s|d:/Firebird|/usr/firebird|" Builds/makefile.environ	&&
  cd Builds/Gcc.lin						&&
# can't use patch because file in msdos format
  sedit "s|-g |-DPIC -fPIC $CFLAGS |;s|/mnt.*7|/usr|;s|/mnt.*10|/usr/firebird|" makefile.linux	&&
# determine the type of Firebird installed
  if [ -f /usr/firebird/lib/libfbembed.so ];then
    LL=fbembed
  else
    LL=fbclient
  fi								&&

  sedit "s/-lgds/-l$LL/;s/-sh/$LDFLAGS -sh/" makefile.linux	&&

  make -f makefile.linux
