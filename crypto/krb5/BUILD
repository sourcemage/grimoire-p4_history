(

  patch  --verbose  src/kadmin/v4server/kadm_ser_wrap.c  <  \
         $SCRIPT_DIRECTORY/2002-002-kadm4.patch             &&

  cd  src
  ./configure  --enable-dns-for-kdc    \
               --enable-dns-for-realm  \
               --prefix=/usr           \
               $OPTS                   &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1  &&  (


  if    [  "$KDC"  ==  "y"  ]
  then  cp  $SCRIPT_DIRECTORY/krb5.sh  /etc/init.d/
        ln  -sf  ../init.d/krb5.sh     /etc/rc3.d/S40krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc4.d/S40krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc5.d/S40krb5

        ln  -sf  ../init.d/krb5.sh     /etc/rc0.d/K60krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc1.d/K60krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc2.d/K60krb5
        ln  -sf  ../init.d/krb5.sh     /etc/rc6.d/K60krb5
  fi

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
