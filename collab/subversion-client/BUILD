# $Id: BUILD,v 1.11 2002/12/11 16:57:15 sergeyli Exp $
(

  if echo $OPTS | grep -q 'without-berkeley-db'; then
    patch -p1 < $SCRIPT_DIRECTORY/swigpyext.patch
  fi &&

  ./configure                \
    --build=$BUILD           \
    --prefix=/usr            \
    --sysconfdir=/etc        \
    --localstatedir=/var     \
    --disable-debug          \
    --disable-mod-activation \
    --disable-static         \
    --enable-dso             \
    --enable-shared          \
    --without-apxs           \
    --without-berkeley-db    \
    $OPTS                    &&

  make &&
  make swig-py-ext &&
  if spell_installed Python; then make check; fi &&

  prepare_install &&
  make    install &&
  make    install-swig-py-ext

) >$C_FIFO 2>&1
