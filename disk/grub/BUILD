(

  if [ ! -e /boot/grub ]; then
    mkdir /boot/grub
  fi

  ./configure  --prefix=/usr       \
               --sbindir=/sbin     && 
  make                             &&
  prepare_install                  &&
  make    install                  &&
  if [ ! -e /boot/grub/stage1 ]; then
    cp /usr/share/grub/i386-pc/*stage* /boot/grub 
  else
    message  "***"
    message  "A new GRUB has been installed.  If you need to reinstall"
    message  "GRUB into your MBR or partition boot record, don't forget"
    message  "to 'cp /usr/share/grub/i386-pc/*stage* /boot/grub' first."
  fi 
  message  "***"
  message  "You need to create a sensible /boot/grub/menu.lst file,"
  message  "then run 'grub' per the 'native installation' instructions."
  message  "the short version: do a 'root (disk,bootpartition)' followed"
  message  "by a 'setup (drive)' or 'setup (drive,partition)' depending"
  message  "on whether you wish to install GRUB in the MBR or a partition."
  message  "See 'info grub' for details, and be certain to have a bootable"
  message  "rescue disk in case you make a mistake and need to recover."
  message  "***"

) > $C_FIFO 2>&1
