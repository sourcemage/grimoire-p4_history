(

  cd  src
  sedit  "s/-Wall/-Wall $CFLAGS/"  compile.sh

  ./compile.sh  &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  cd  bin
  cp  compilercache  compilercache.original
  mkdir  -p                              /usr/bin/$SPELL
  cp     -a  *                           /usr/bin/$SPELL
  cp    $SCRIPT_DIRECTORY/compilercache  /usr/bin/$SPELL

)
