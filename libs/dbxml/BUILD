(
  if [ -z $JAVA_HOME ]; then
    if spell_ok j2sdk; then
      export JAVA_HOME=/opt/java/j2sdk
    elif spell_ok j2sdk-bin; then
      export JAVA_HOME=/usr/lib/j2sdk1.4.1
    fi
  fi &&
  if [[ $JAVA_HOME ]] && [ "$JAVADB" == '--enable-java' ]; then
    OPTS="$OPTS $JAVADB"
  fi &&

  cd build_unix &&
  PATH=$JAVA_HOME/bin:$PATH &&
  ../dist/configure \
    --prefix=/usr   \
    --build=$BUILD  \
    $OPTS           &&

  make &&
  prepare_install &&
  make    install

) >$C_FIFO 2>&1
