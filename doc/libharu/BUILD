  ln -s makefile.gcc Makefile	&&
  sedit \
"s|/local||;s|^MYCPPFLAGS=|MYCPPFLAGS=$CFLAGS|;s|^MYLDFLAGS=|MYLDFLAGS=$LDFLAGS|" \
	Makefile		&&
  make
