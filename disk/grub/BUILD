(
  # gcc 3.3 patch from LFS
  bzcat  ${SOURCE_CACHE}/${SOURCE2}  |  patch  -p1  &&

  # malign is obsolete
  sedit  's/malign-jumps/falign-jumps/'  configure          &&
  sedit  's/malign-loops/falign-loops/'  configure          &&
  sedit  's/malign-functions/falign-functions/'  configure  &&

  if [ ! -e /boot/grub ]; then
    mkdir /boot/grub
  fi

  unset CFLAGS
  unset CXXFLAGS

  ./configure  --build=$BUILD                \
               --prefix=/usr                 \
               --sbindir=/sbin               \
               --mandir=/usr/share/man       \
               --infodir=/usr/share/info     \
               --disable-auto-linux-mem-opt  \
               $OPTS                         &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&

  #  Sample image, replace with SMGL image
  cp  $SCRIPT_DIRECTORY/splash.xpm.gz  /boot/grub
  # this will create a sensible menu.lst.skel in the future

) > $C_FIFO 2>&1
