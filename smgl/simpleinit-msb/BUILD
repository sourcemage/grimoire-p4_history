(

  patch -p1 < $SCRIPT_DIRECTORY/simpleinit.patch &&

  ./configure                             &&
#  sedit  's/CFLAGS.*:=/CFLAGS := -DDEBUG_GETPATH=1 /'  mconfig  &&
  make  OPT="$CFLAGS"                     &&
  prepare_install                         &&
  make  DESTDIR=${INSTALL_ROOT}           \
           ROOT=${INSTALL_ROOT}           \
        install

) > $C_FIFO 2>&1
