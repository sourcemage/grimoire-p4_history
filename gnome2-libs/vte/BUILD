(

  patch -p0 < $SCRIPT_DIRECTORY/keymap.diff &&
  OPTS="$OPTS --disable-gtk-doc" &&
  default_build

) > $C_FIFO 2>&1
