(

  export  QTDIR=$SOURCE_DIRECTORY

  if  spell_installed  postgresql;  then
    cd  $SOURCE_DIRECTORY  &&
    tar  -zxpf  /var/spool/sorcery/postgresql-`installed_version postgresql`.tar.gz  &&
    cd  postgresql-`installed_version postgresql`  &&
    ./configure  &&
    cd  $SOURCE_DIRECTORY
  fi  &&

  echo  "yes"  |  ./configure                      \
                               -prefix /usr/lib/qt \
                               -bindir /usr/bin    \
                               -libdir /usr/lib    \
                               -docdir /usr/doc/qt-copy \
                               -headerdir /usr/include/qt \
                               -datadir /usr/share/qt \
                               -thread             \
                               -qt-gif             \
                               -no-g++-exceptions  \
                               -xft                \
                               $OPTS               &&
  make symlinks sub-src sub-tools                  &&
  prepare_install                                  &&
  make install                                     &&
  mv -f /usr/lib/qt/bin/* /usr/bin                 &&
  rm -rf /usr/lib/qt/bin

) > $C_FIFO 2>&1
