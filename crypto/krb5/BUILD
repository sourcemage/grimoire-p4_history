(

  cd  src
  ./configure  --enable-dns-for-kdc    \
               --enable-dns-for-realm  \
               --prefix=/usr           \
               --localstatedir=/var    \
               $OPTS                   &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&  (


  if    !  [  -f  /etc/krb5.conf  ]
  then  cp  src/config-files/krb5.conf  /etc
  fi

  if    !  [  -f  /etc/kdc.conf  ]
  then  sedit  "s:local/::g"  src/config-files/kdc.conf
        cp  src/config-files/kdc.conf  /etc
  fi

)
