(

  cd ./icap/   && make && cd .. &&
  cd ./mstore/ && make && cd .. &&

  OPTS="$OPTS --with-icap --with-mstore" &&
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var $OPTS &&
  make &&

  prepare_install &&
  make install

) >$C_FIFO 2>&1 && (

  mkdir -p   /var/calendar &&
  chmod 1777 /var/calendar

)
