(

  # fixes bug in pinentry-qt build files.
	sedit  "s/pinentry.h/..\/pinentry\/pinentry.h/g"  "qt/main.cpp"
	
  ./configure --prefix=/usr                      \
              --disable-pinentry-curses          \
              --disable-fallback-curses          \
							-with-qt-includes=/usr/include/qt  \
							-enable-pinentry-qt                \
							$OPTS                             &&
	make                                          &&
	prepare_install                               &&
	make install

) > $C_FIFO 2>&1
