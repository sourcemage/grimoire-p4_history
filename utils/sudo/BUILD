EDITOR=`which  $EDITOR  2>/dev/null`  ||
EDITOR=`which  nano`                  &&

(

  ./configure  --prefix=/usr          \
               --with-editor=$EDITOR  &&
  make                                &&
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1
