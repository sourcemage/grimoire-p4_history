ln -s makefile.gcc Makefile	    &&

sedit \
  "s|/local|$INSTALL_ROOT|;s|^MYCPPFLAGS=|MYCPPFLAGS=$CFLAGS|;s|^MYLDFLAGS=|MYLDFLAGS=$LDFLAGS|" \
  Makefile		                &&

make
