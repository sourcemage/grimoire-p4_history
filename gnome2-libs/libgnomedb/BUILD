(

   patch -p0 < $SCRIPT_DIRECTORY/makefile.diff &&
   OPTS="$OPTS --disable-gtk-doc" &&
   default_build

) > $C_FIFO 2>&1
