(

  if [ ! -e /boot/grub ]; then
    mkdir /boot/grub
  fi

  ./configure  --prefix=/usr       \
               --sbindir=/sbin     && 
  make                             &&
  prepare_install                  &&
  make    install
  # this will create a sensible menu.lst.skel in the future

) > $C_FIFO 2>&1
