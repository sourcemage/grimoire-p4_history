CFLAGS="$CFLAGS -I/usr/include/lzo" &&
if ! [ "$GNUTLS_OLD" == y ]; then
  # fix a problem with bad flow in the code
  patch -p1 < $SCRIPT_DIRECTORY/gnutls_compress_int.diff &&
  patch -p1 < $SCRIPT_DIRECTORY/gnutls_extra.diff
fi &&
default_build
