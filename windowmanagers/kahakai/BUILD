(

  # build compatible swig version
  cd  SWIG-1.3.17  &&
  ./configure  --prefix=$SOURCE_DIRECTORY/swig  &&
  make           &&
  make  install  &&
  cd  $SOURCE_DIRECTORY  &&
  export PATH=$SOURCE_DIRECTORY/swig/bin:$PATH  &&

  default_build

) > $C_FIFO 2>&1
