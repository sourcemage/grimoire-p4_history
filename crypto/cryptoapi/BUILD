no_export_symbol()  {
  cp  api/cryptoapi.c api/cryptoapi.c.old
 sedit "s|EXPORT_SYMBOL|// EXPORT_SYMBOL|" api/cryptoapi.c
}

# no_export_symbol

  patch  -p1  <  $SCRIPT_DIRECTORY/cryptoapi.patch

(

  sedit  "s/-O2/$CFLAGS/"  configure

  default_build &&
  depmod

) > $C_FIFO 2>&1
