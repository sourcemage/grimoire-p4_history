export MOZILLA_FIVE_HOME=/usr/lib/mozilla

(

  if echo $CFLAGS | grep -q pentium4; then
    export CFLAGS="${CFLAGS/-O3/}"
  fi &&

  ./configure                   \
    --prefix=/usr               \
    --with-x                    \
    --with-pthreads             \
    --enable-xft                \
    --enable-freetype2          \
    --enable-extensions         \
    --enable-reorder            \
    --enable-strip              \
    --enable-optimize="$CFLAGS" \
    --enable-default-mozilla-five-home=$MOZILLA_FIVE_HOME \
    --disable-debug             \
    --disable-tests             \
    --disable-installer         \
    $OPTS                       &&
  make                          &&

  if echo "$OPTS" | grep -q 'enable-crypto'; then
    message "Building crypto support (Personal Security Manager)..." &&
    pushd security/manager && make && popd
  fi &&

  if [ "$MOZILLA_ENIGMAIL" == y ]; then
    message "Building IPC and Enigmail extensions..." &&
    pushd extensions/ipc      && make && popd &&
    pushd extensions/enigmail && make && popd
  fi &&

  prepare_install

) > $C_FIFO 2>&1 && (

  rm     -f                            $MOZILLA_FIVE_HOME/component.reg
  mkdir  -p                            $MOZILLA_FIVE_HOME
  mkdir  -p                            $MOZILLA_FIVE_HOME/plugins
  cp     -rL dist/bin/*                $MOZILLA_FIVE_HOME/
  mkdir  -p                            /usr/include/mozilla
  cp     -rL dist/include/*            /usr/include/mozilla/
  mkdir  -p                            /usr/include/moznss
  cp     -L  dist/public/security/*    /usr/include/moznss/
  cp         $SCRIPT_DIRECTORY/mozilla /usr/bin/

  for package in build/unix/*.pc; do
    message "Processing $package..."
    sedit "s/mozilla-$VERSION/mozilla/g" $package
    cp $package /usr/lib/pkgconfig/
  done

  for library in $MOZILLA_FIVE_HOME/*.so; do
    message "Linking $library..."
    libname=$(basename $library)
    ln -fns mozilla/$libname /usr/lib/$libname
  done

  export LD_LIBRARY_PATH=$MOZILLA_FIVE_HOME:$LD_LIBRARY_PATH
  $MOZILLA_FIVE_HOME/regxpcom
  $MOZILLA_FIVE_HOME/regchrome

  touch  $MOZILLA_FIVE_HOME/chrome/user-skins.rdf
  touch  $MOZILLA_FIVE_HOME/chrome/user-locales.rdf

)
