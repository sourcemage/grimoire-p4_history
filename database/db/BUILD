patch -p1 < $SCRIPT_DIRECTORY/javafix.diff &&
sedit 's|\(docdir\w*=\w*[^/]*\)/docs|\1/share/doc/db|' dist/Makefile.in &&

OPTS="$OPTS $DB_JSUP $TESTS"  &&

echo TRACK_ROOT = $TRACK_ROOT > /tmp/db.j &&

if  [  "$DB_JSUP"  ==  "--enable-java"  ];  then
  echo DB_JSUP = $DB_JSUP >> /tmp/db.j &&
  if  [  -f  $TRACK_ROOT/etc/profile.d/java.sh  ];  then
    source  $TRACK_ROOT/etc/profile.d/java.sh  &&
    echo JAVA_HOME = $JAVA_HOME  >> /tmp/db.j &&
    echo PATH = $PATH  >> /tmp/db.j
  else
    message  "${PROBLEM_COLOR}The provider ${SPELL_COLOR}JAVA${DEFAULT_COLOR}" \
             "${PROBLEM_COLOR} is not installed.${DEFAULT_COLOR}"             &&
    return  1
  fi
fi  &&

# this is needed to make db using stuff work on nptl glibc, do _not_ remove it!
if glibc_is_nptl; then
  LDFLAGS="$LDFLAGS -lpthread"
fi &&

cd  build_unix                         &&

../dist/configure  --prefix=$INSTALL_ROOT/usr  \
                   --build=$BUILD              \
                   --enable-dynamic            \
                   --enable-compat185          \
                   $OPTS                       &&
make
