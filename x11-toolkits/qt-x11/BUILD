 (
# speed up up build process by removing unnecessary examples
rm -r examples
rm -r extensions/nsplugin/examples
#rm -r extensions/xt/examples
rm -r tools/designer/examples
#rm -r tools/designer/tutorials
#rm -r tools/linguist/tutorial
#rm -r tools
rm -r tutorial

# fixes a font issue in qt 3.3.1
patch src/kernel/qfontdatabase_x11.cpp < $SCRIPT_DIRECTORY/qfontdatabase_x11.diff &&

# add better optimisation flags
sedit "s#-O2#$CFLAGS#" mkspecs/linux-g++/qmake.conf &&
sedit "s#-O2#$CFLAGS#" mkspecs/linux-cxx/qmake.conf &&

export QTDIR=$SOURCE_DIRECTORY  &&
export LD_LIBRARY_PATH=$SOURCE_DIRECTORY/lib:$LD_LIBRARY_PATH &&

#if [ -x /usr/bin/uic ]
#then for i in $(< $SCRIPT_DIRECTORY/install.log)
#     do rm -f $i
#     done
#fi                                                  &&

#  if  spell_installed  postgresql;  then
#    cd  $SOURCE_DIRECTORY  &&
#   tar  -zxpf  /var/spool/sorcery/postgresql-`installed_version postgresql`.tar.gz  &&
#    cd  postgresql-`installed_version postgresql`  &&
#    ./configure  &&
#    cd  $SOURCE_DIRECTORY
#  fi  &&

  echo  "yes"  |  ./configure                      \
                               -prefix ${INSTALL_ROOT}/usr/lib/qt \
                               -bindir ${INSTALL_ROOT}/usr/bin    \
                               -libdir ${INSTALL_ROOT}/usr/lib    \
                               -docdir ${INSTALL_ROOT}/usr/doc/qt-x11 \
                               -headerdir ${INSTALL_ROOT}/usr/include/qt \
                               -datadir ${INSTALL_ROOT}/usr/share/qt \
                               -thread             \
                               -qt-gif             \
                               -xft                \
                               $OPTS            &&

  make  symlinks  sub-src sub-tools                &&
  prepare_install                                  &&
  make install                                     &&

  ln -sf ${INSTALL_ROOT}/usr/lib/libqt-mt.so.${VERSION} /usr/lib/libqt-mt.so &&
  ln -sf ${INSTALL_ROOT}/usr/lib/libqt-mt.so  /usr/lib/libqt.so  &&

  mkdir -p ${INSTALL_ROOT}/etc/profile.d/   &&
  install -m 0644 $SCRIPT_DIRECTORY/qt.sh   \
           ${INSTALL_ROOT}/etc/profile.d/

) > $C_FIFO 2>&1
