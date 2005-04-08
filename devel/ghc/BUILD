[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

GHC=ghc

make_single  &&

if [[ $SOURCE2 != "" ]] ; then
  cd ghc-bin &&
  ./configure &&
  make in-place &&
  GHC=$PWD/bin/i386-unknown-linux/ghc &&
  cd ..
fi &&

cd $SPELL-$VERSION &&

OPTS="$OPTS --with-ghc=$GHC --with-hc=$GHC"  &&
default_build
