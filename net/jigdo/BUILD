(

  # Set to compile without the GUI, as it breaks the compile...
  #OPTS="$OPTS --without-gui"

  patch -p1 < $SCRIPT_DIRECTORY/db-4.1.patch  &&
  default_build

) > $C_FIFO
