(

  make < $SCRIPT_DIRECTORY/atlas-3.4.0.config     &&
  ARCH=`ls -1 Make.Linux* | sed -e 's/Make.//'`   &&
  make  install  arch=$ARCH                       &&
  SOURCE_LIB=$SOURCE_DIRECTORY/lib/$ARCH          &&
  install -m 0644 $SOURCE_LIB/libatlas.a    /usr/lib  &&
  install -m 0644 $SOURCE_LIB/libcblas.a    /usr/lib  &&
  install -m 0644 $SOURCE_LIB/libf77blas.a  /usr/lib  &&
  install -m 0644 $SOURCE_LIB/liblapack.a   /usr/lib  &&
  install -m 0644 $SOURCE_DIRECTORY/include/cblas.h      /usr/include  &&
  install -m 0644 $SOURCE_DIRECTORY/include/clapack.h.a  /usr/include

) > $C_FIFO 2>&1
