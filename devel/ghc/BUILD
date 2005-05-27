[[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

GHC_DIR=ghc

make_single  &&

if [[ $SOURCE2 != "" ]] ; then
  cd ghc-bin &&
  ./configure &&
  make in-place &&
  GHC_DIR=$PWD/bin/i386-unknown-linux/ghc &&
  cd ..
fi &&

cd $SPELL-$VERSION &&

OPTS="$OPTS --with-ghc=$GHC_DIR --with-hc=$GHC_DIR"  &&
default_build
