(

# Make it work with gcc3
  patch -p1 < $SCRIPT_DIRECTORY/flash-gcc3.patch &&

# The KDE screensaver doesn't work with kde3
  sedit 's:SUBDIRS=.*:SUBDIRS= Jpeg Zlib Lib Player Plugin:' Makefile &&

  make            &&
  prepare_install &&

  mkdir -p            /usr/bin  &&
  cp Player/swfplayer /usr/bin/ &&

  mkdir -p             /usr/lib/mozilla/plugins  &&
  cp Plugin/npflash.so /usr/lib/mozilla/plugins/

) >$C_FIFO 2>&1
