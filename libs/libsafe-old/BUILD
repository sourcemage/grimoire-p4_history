(
  bzcat $SCRIPT_DIRECTORY/glibc-2.2.4-cleanup_region_start.diff.bz2 | patch -p1 &&
  make                         &&
  # Hack to avoid mayhem if libsafe is removed by dispel
  perl -i -pe 's:\S*/libsafe.\S*::' /etc/ld.so.preload &&
  prepare_install              &&
  make  bindir=/bin  install 
  if [ -x /lib/libsafe.so.2 ] ; then
    if grep libsafe /etc/ld.so.preload ; then
      true
    else
      echo '/lib/libsafe.so.2' > /etc/ld.so.preload
    fi
  fi
) > $C_FIFO 2>&1
