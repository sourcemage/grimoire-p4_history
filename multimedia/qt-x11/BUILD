(

#  if [ -f /usr/bin/objprelink ]; then

  if  spell_installed objprelink; then
    patch -p 0 < $SCRIPT_DIRECTORY/qt-configs.patch
  fi

  export  QTDIR=$SOURCE_DIRECTORY

  echo  "yes"  |  ./configure  -release            \
                               -shared             \
                               -thread             \
                               -gif                \
                               -system-libmng      \
                               -system-libpng      \
                               -system-jpeg        \
                               -system-zlib        \
                               -no-g++-exceptions  \
                               -xft                \
                               $OPTS               &&
  make                                             &&
  prepare_install                                  &&
  mkdir  -p                /usr/include/qt         &&
  cp         include/*     /usr/include/qt         &&
  cp     -r  lib           /usr                    &&
  cp     -r  bin           /usr                    &&
  cp     -r  doc/man       /usr                    &&
  mkdir  -p                /usr/doc/qt             &&
  cp     -r  doc/html      /usr/doc/qt

) > $C_FIFO 2>&1
