(
# speed up up build process by removing unnecessary examples
rm -r examples
rm -r extensions/nsplugin/examples
rm -r extensions/xt/examples
rm -r tools/designer/examples
#rm -r tools/designer/tutorials
#rm -r tools/linguist/tutorial
#rm -r tools
rm -r tutorial

# add better optimisation flags
sedit "s#-O2#$CFLAGS#" mkspecs/linux-g++/qmake.conf &&
sedit "s#-O2#$CFLAGS#" mkspecs/linux-cxx/qmake.conf &&

export QTDIR=$SOURCE_DIRECTORY  &&

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
                               -docdir /usr/doc/qt-x11 \
                               -headerdir /usr/include/qt \
                               -datadir /usr/share/qt \
                               -thread             \
                               -qt-gif             \
                               $OPTS               &&

  make symlinks sub-src sub-tools                  &&
  prepare_install                                  &&
  make install                                     &&
  ln -sf /usr/lib/libqt-mt.so.${VERISON} /usr/lib/libqt-mt.so

) > $C_FIFO 2>&1
