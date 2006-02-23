# add better optimisation flags
sedit "s#-O2#$CFLAGS#" mkspecs/linux-g++/qmake.conf &&
sedit "s#-O2#$CFLAGS#" mkspecs/linux-cxx/qmake.conf &&

export QTDIR=$SOURCE_DIRECTORY  &&
export LD_LIBRARY_PATH=$SOURCE_DIRECTORY/lib:$LD_LIBRARY_PATH &&

OPTS="$QT_DEBUG   \
      $QT_NIS     \
      $QT_XRAMA   \
      $QT_GIF     \
      $OPTS"      &&

invoke_gcc                                                                     &&
echo  "yes"  |  ./configure                                                    \
                             -prefix $INSTALL_ROOT/usr/lib/qt                  \
                             -bindir $INSTALL_ROOT/usr/bin                     \
                             -libdir $INSTALL_ROOT/usr/lib                     \
                             -docdir $INSTALL_ROOT/usr/share/doc/qt-x11        \
                             -headerdir $INSTALL_ROOT/usr/include/qt           \
                             -examplesdir $INSTALL_ROOT/usr/share/qt/examples  \
                             -demosdir $INSTALL_ROOT/usr/share/qt/demos        \
                             -datadir $INSTALL_ROOT/usr/share/qt               \
                             -platform linux-g++                               \
                             $OPTS                                             &&

make
