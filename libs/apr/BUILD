(

  # So headers are installed in the right place
  sedit  's/apache2/apr/'  configure  &&

  OPTS="$OPTS --enable-layout=GNU"
  default_build  &&

  # Need this to be able to compile apr-util
  install  -m 644  build/make_exports.awk  build/make_var_export.awk  \
              /usr/share/apr/build                       &&
  ln  -sf  /usr/bin/apr-config           /usr/share/apr  &&
  ln  -sf  /usr/share/apr/build/libtool  /usr/share/apr

) > $C_FIFO 2>&1
