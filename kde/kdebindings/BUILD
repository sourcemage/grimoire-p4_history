(
if [ $JAVA_HOME ]
then OPTS="$OPTS --with-java=$JAVA_HOME"
else OPTS="$OPTS --without-java"
fi
  ./configure  --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --disable-debug       \
               --enable-final        \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
