(

  export  QTDIR=$SOURCE_DIRECTORY

  echo  "yes"  |  ./configure                      \
                               -prefix /usr        \
                               -bindir /usr/bin    \
			       -libdir /usr/lib    \
			       -docdir /usr/doc/qt-x11-free \
			       -headerdir /usr/include/qt \
			       -plugindir /usr/lib/qt/plugin \
			       -datadir /usr/share/qt \
                               -qt-gif             \
                               -system-zlib        \
                               -no-g++-exceptions  \
                               -system-libpng      \
                               -system-libjpeg     \
                               -system-libmng      \
                               -xft                \
                               $OPTS               &&
  make                                             &&
  prepare_install                                  &&
  make install

) > $C_FIFO 2>&1
