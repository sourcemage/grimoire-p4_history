(

  if  get_status  gcc2 ;  then
    # malign is obsolete for gcc3 only
    # this should only be run if the system has gcc3 installed
    # i.e. any system that has the gcc2 spell in the grimoire
    # has gcc3 installed by default.
    sedit  's/malign-jumps/falign-jumps/'  configure  &&
    sedit  's/malign-loops/falign-loops/'  configure  &&
    sedit  's/malign-functions/falign-functions/'  configure
  fi

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
