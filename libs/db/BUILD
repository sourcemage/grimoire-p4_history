(
  patch -p1 < $SCRIPT_DIRECTORY/javafix.diff &&
  sedit 's|\(docdir\w*=\w*[^/]*\)/docs|\1/share/doc/db|' dist/Makefile.in &&

  patch -p0 < $SOURCE_CACHE/$SOURCE2 &&
  patch -p0 < $SOURCE_CACHE/$SOURCE3 &&

  if echo "$OPTS" | grep -q 'enable-java'; then
    if [ -z $JAVA_HOME ]; then
      if spell_installed j2sdk; then
        JAVA_HOME=$INSTALL_ROOT/usr/java/j2sdk
      elif spell_installed j2sdk-bin; then
        JAVA_HOME=$INSTALL_ROOT/usr/lib/j2sdk1.4.2
      fi
    fi &&
    message 'Checking that JAVA_HOME is defined...' &&
    [ -n "$JAVA_HOME" ] &&
    export JAVA_HOME
  fi &&

  if /lib/libc.so.6 | grep -q NPTL; then
    LDFLAGS="$LDFLAGS -lpthread"
  fi &&

  cd  build_unix                         &&
  PATH="$PATH:$JAVA_HOME/bin"            &&
  ../dist/configure  --prefix=$INSTALL_ROOT/usr       \
                     --build=$BUILD      \
                     --enable-dynamic    \
                     --enable-compat185  \
                     --enable-cxx        \
                     $OPTS               &&
  make                                   &&
  prepare_install                        &&
  make    install                        &&

  if echo "$OPTS" | grep -q 'enable-test'; then
    sedit 's|^set tcllib.*$||' ../test/include.tcl &&
    echo "set tcllib $INSTALL_ROOT/usr/lib/libdb_tcl-${VERSION%.*}.so" >> ../test/include.tcl &&
    mkdir -p $INSTALL_ROOT/usr/share/$SPELL &&
    cp -R ../test $INSTALL_ROOT/usr/share/$SPELL/
  fi

) >$C_FIFO 2>&1
