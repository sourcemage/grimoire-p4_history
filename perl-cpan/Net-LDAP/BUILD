(
#  export LDAPSDKDIR=/usr
#  export LDAPV3ON=Y
#  echo $OPTS | grep -q "\--with-ssl" && export LDAPSDKSSL=Y

  perl Makefile.PL &&
  make             &&
  make test        &&
  prepare_install  &&
  make install
) > $C_FIFO 2>&1
