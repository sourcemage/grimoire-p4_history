MOZILLA_HOME=$INSTALL_ROOT/usr/lib/mozilla    &&

if  [  "$MOZILLA_ENIGMAIL"  ==  'y'  ];  then
  MOZILLA_EXT="$MOZILLA_EXT,ipc,enigmail"
fi  &&

if  [  "$MOZILLA_RENDER"  ==  'libart_svg'  ];  then
  export MOZ_INTERNAL_LIBART_LGPL=1
fi  &&

#
# Only strip if the user wants us to
#
if  echo  $LDFLAGS  |  grep  -q  --  '-s';  then
  OPTS="$OPTS  --enable-strip"
fi  &&

echo OPTS = $OPTS > /tmp/mozilla.opts
echo MOZILLA_EXT = $MOZILLA_EXT >> /tmp/mozilla.opts
echo MOZ_INTERNAL_LIBART_LGPL = $MOZ_INTERNAL_LIBART_LGPL >> /tmp/mozilla.opts

#
# No fast optimization for Mozilla, bit us so many times...
#
CFLAGS="${CFLAGS//-O3/-O2}"      &&
CXXFLAGS="${CXXFLAGS//-O3/-O2}"  &&

./configure               --prefix=$INSTALL_ROOT/usr            \
                          --mandir=$INSTALL_ROOT/usr/share/man  \
  --with-default-mozilla-five-home=$MOZILLA_HOME                \
               --enable-extensions=all${MOZILLA_EXT}            \
                 --enable-optimize="$CFLAGS"                    \
                            --with-pthreads                     \
                          --enable-xft                          \
                          --enable-reorder                      \
                          --enable-cpp-rtti                     \
                         --disable-debug                        \
                         --disable-tests                        \
                         --disable-installer                    \
                         --disable-pedantic                     \
                                   $OPTS                        &&

#
# fix a problem of enigmail not compiling
# because S/MIME IDL files are not exported
#
if  !  make export;  then
  pushd  mailnews/extensions/smime/public  &&
  make  export                             &&
  popd                                     &&
  make  export
fi  &&

make_single  &&
make
