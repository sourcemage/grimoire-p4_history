(

  OPTS="$OPTS --enable-mtime"

  # Disables bundled pcre and adds install target to makefile
  patch  -p1  <  $SCRIPT_DIRECTORY/mman.patch  &&
  default_build &&

  if ! [  -f /etc/mman.conf  ]; then
    install  -m 640  config.xml  /etc/mman.conf
  fi

) > $C_FIFO 2>&1
