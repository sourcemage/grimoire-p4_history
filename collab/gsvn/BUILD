# $Id: BUILD,v 1.1 2002/10/25 18:57:12 sergeyli Exp $
(

  ./autogen.sh                &&
  ./configure                 \
    --build=$BUILD            \
    --prefix=/usr             \
    --sysconfdir=/etc         \
    --localstatedir=/var      \
    --disable-maintainer-mode \
    $OPTS                     &&

  make            &&
  prepare_install &&
  make    install

) > $C_FIFO 2>&1
