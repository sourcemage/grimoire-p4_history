(
  if [ ! -e /boot/grub ]; then
    mkdir /boot/grub
  fi

  unset CFLAGS
  unset CXXFLAGS
  CFLAGS="-Os -g" ; export CFLAGS

  ./configure  --build=$BUILD           \
              --prefix=/usr             \
             --sbindir=/sbin            \
              --mandir=/usr/share/man   \
             --infodir=/usr/share/info  \
             $OPTS                      &&

  make                                  &&
  prepare_install                       &&
  make    install                       &&

  chmod 750 /sbin/grub*                 &&

  #  Sample image, replace with SMGL image
  mkdir -p /boot/grub/images/           &&
  cp  $SCRIPT_DIRECTORY/smgl-splash.xpm.gz  /boot/grub/images
  # this will create a sensible menu.lst.skel in the future

) > $C_FIFO 2>&1
