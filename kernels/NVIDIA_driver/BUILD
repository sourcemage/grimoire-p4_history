(

  sh $SOURCE_CACHE/$SOURCE --extract-only
  cd NVIDIA-Linux-x86-$VERSION

  prepare_install
  make install

) > $C_FIFO 2>&1
