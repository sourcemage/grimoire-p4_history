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


#sedit "s#\$(QTDIR)/lib#/usr/lib/qt#" \
#               tools/designer/designer/designer.pro &&
#sedit "s#../../../lib#/usr/lib/qt#" \
#               tools/designer/uilib/uilib.pro &&
#sedit "s#../../../lib#/usr/lib/qt#" \
#               tools/designer/editor/editor.pro &&


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
                               -xft                \
                               $OPTS               &&

  # Fix for buggy configure script in qt 3.0.5
  dir1=$SOURCE_DIRECTORY/include                   &&
  file1=qconfig.h                                  &&
  dir2=$SOURCE_DIRECTORY/src                       &&
  file2=Makefile                                   &&
  sed 's/\/usr\/share\/qt/"\/usr\/share\/qt"/' $dir1/$file1 > \
     $dir1/$file1.tmp &&
  mv $dir1/$file1.tmp $dir1/$file1                 &&
  sed '/strip "$(INSTALL_ROOT)\/usr\/doc\/qt-x11\/"/d' $dir2/$file2 > \
     $dir2/$file2.tmp &&
  mv $dir2/$file2.tmp $dir2/$file2                 &&


  make symlinks sub-src sub-tools                  &&
  prepare_install                                  &&
  make install                                     &&
  mv -f /usr/lib/qt/bin/* /usr/bin                 &&
  rm -rf /usr/lib/qt/bin			   &&
  ln -sf /usr/lib/libqt-mt.so.3.0.5 /usr/lib/libqt-mt.so

) > $C_FIFO 2>&1
