(

  patch  -p1  <  $SCRIPT_DIRECTORY/krb5-1.2.8.patch &&

  cd  src
  ./configure  --enable-dns-for-kdc    \
               --enable-dns-for-realm  \
               --prefix=/usr           \
               $OPTS                   &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&  (


  if    [  "$MASTER"  ==  "y"  ]
  then  sedit  "s:# /usr:/usr:"  /etc/init.d/krb5.sh
  fi

  if    !  [  -f  /etc/krb5.conf  ]
  then  cp  src/config-files/krb5.conf  /etc
  fi

  if    !  [  -f  /etc/kdc.conf  ]
  then  sedit  "s:local/::g"  src/config-files/kdc.conf
        cp  src/config-files/kdc.conf  /etc/init.d/
  fi

)
