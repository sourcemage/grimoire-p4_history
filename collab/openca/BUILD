# $Id: BUILD,v 1.2 2002/10/03 00:14:27 sergeyli Exp $
(
  local COUNTRY=${LANG##*-}

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --with-web-host=`hostname` \
               --with-httpd-host=nobody \
               --with-httpd-user=nogroup \
               --with-ca-organization=`hostname` \
               --with-ca-country=${COUNTRY:-US} \
               $OPTS                 &&
  make
  prepare_install
  make install-ca

) > $C_FIFO 2>&1
