# $Id: BUILD,v 1.11 2002/12/11 16:57:15 sergeyli Exp $
(

  ./configure                 \
    --build=$BUILD            \
    --prefix=/usr             \
    --sysconfdir=/etc         \
    --localstatedir=/var      \
    --disable-dso             \
    --disable-maintainer-mode \
    --disable-mod-activation  \
    --disable-shared          \
    --enable-all-static       \
    --without-berkeley-db     &&
  make                        &&

  prepare_install &&
  make    install &&
  make    check

) >$C_FIFO 2>&1
