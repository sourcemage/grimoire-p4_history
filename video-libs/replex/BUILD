(

  export CFLAGS="${CFLAGS} -g -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE" &&
  patch -p0 < $SCRIPT_DIRECTORY/makefile.patch     &&
  make                                             &&
  prepare_install                                  &&
  make    install

) > $C_FIFO 2>&1
