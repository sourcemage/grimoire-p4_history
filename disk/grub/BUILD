(

  # malign is obsolete
  sedit  's/malign-jumps/falign-jumps/'  configure  &&
  sedit  's/malign-loops/falign-loops/'  configure  &&
  sedit  's/malign-functions/falign-functions/'  configure  &&

  if [ ! -e /boot/grub ]; then
    mkdir /boot/grub
  fi

  ./configure  --build=$BUILD      \
               --prefix=/usr       \
               --sbindir=/sbin     \
               $OPTS               &&
  make                             &&
  prepare_install                  &&
  make    install
  # this will create a sensible menu.lst.skel in the future

) > $C_FIFO 2>&1
