if  echo  $OPTS  |  grep  -q  --  "no-krb5";  then
  OPENSSL_KRB5="no-krb5"
fi  &&

./config  --prefix=${INSTALL_ROOT}/usr      \
      --openssldir=${INSTALL_ROOT}/etc/ssl  \
          shared threads                    \
          $OPENSSL_KRB5                     &&

sedit  "s/-O3//"                    Makefile                &&
sedit  "s/-m486//"                  Makefile                &&
sedit  "s/^CFLAG=/CFLAG=$CFLAGS /"  Makefile                &&
sedit  "s/chmod 644\(.*pkgconfig\)/chmod 755\1/"  Makefile  &&

make_single  &&
make
