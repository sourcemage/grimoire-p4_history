patch -p1 < $SCRIPT_DIRECTORY/javafix.diff &&
sedit 's|\(docdir\w*=\w*[^/]*\)/docs|\1/share/doc/db|' dist/Makefile.in &&

#  patch -p0 < $SOURCE_CACHE/$SOURCE2 &&
#  patch -p0 < $SOURCE_CACHE/$SOURCE3 &&

#  if echo "$OPTS" | grep -q 'enable-java'; then
OPTS="$OPTS $JSUP $TESTS"
if [ "JSUP" == "enable-java" ]; then
  if [ -z $JAVA_HOME ]; then
    if spell_ok j2sdk; then
      JAVA_HOME=$INSTALL_ROOT/usr/java/j2sdk
    elif spell_ok j2sdk-bin; then
      JAVA_HOME=$INSTALL_ROOT/usr/lib/j2sdk1.4.2
    elif spell_ok jdk1.5-bin; then
      JAVA_HOME=$INSTALL_ROOT/usr/lib/jdk1.5.0_01
    fi
  fi &&
  message 'Checking that JAVA_HOME is defined...' &&
  [ -n "$JAVA_HOME" ] &&
  export JAVA_HOME
fi &&

# this is needed to make db using stuff work on nptl glibc, do _not_ remove it!
if glibc_is_nptl; then
  LDFLAGS="$LDFLAGS -lpthread"
fi &&

cd  build_unix                         &&
PATH="$PATH:$JAVA_HOME/bin"            &&

../dist/configure  --prefix=$INSTALL_ROOT/usr  \
                   --build=$BUILD              \
                   --enable-dynamic            \
                   --enable-compat185          \
                   $OPTS                       &&
make
