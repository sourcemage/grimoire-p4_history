(
  cp $SOURCE_CACHE/$SOURCE2 $SOURCE_DIRECTORY &&
  gunzip $SOURCE2  &&
  patch -p1 < esound-0.2.24-ztp20020319_0.patch &&

  default_build
  
) > $C_FIFO 2>&1

