(

#  sedit "s/ri.##v/ri.v/g" $SOURCE_DIRECTORY/plug-ins/python/pydia-geometry.c &&
#  sedit "s/rf.##v/rf.v/g" $SOURCE_DIRECTORY/plug-ins/python/pydia-geometry.c &&

  export PYTHON_LIBS="-lpython2.3"                  &&
  ./configure  --build=$BUILD                       \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&
  make    install                                   &&
  cp -R shapes/Cisco ${INSTALL_ROOT}/usr/share/dia/shapes


) > $C_FIFO 2>&1

