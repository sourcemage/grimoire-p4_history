  if [ "$SELINUX" == "y" ]; then
    zcat $SOURCE_CACHE/$SOURCE2 | patch -p1
  fi &&
  sed -i "s/-O2/${CFLAGS}/" Makefile &&
  make -e XSCPT='' DESTDIR=${INSTALL_ROOT}
