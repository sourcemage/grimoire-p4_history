(

  if  spell_installed  Linux-PAM;  then
    WITH_PAM="--with-pam"
  fi


  ./configure  --sysconfdir=/etc  \
               --prefix=/usr      \
               --with-largefile   \
               --with-everything  \
               $WITH_PAM          \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1  &&  (


  if    [  !  -f  /etc/ftplockout  ]
  then  cp  pam/ftplockout  /etc
  fi

  if    [  !  -e  /etc/pure-ftpd.conf  ]
  then  cp  $SCRIPT_DIRECTORY/pure-ftpd.conf /etc/pure-ftpd.conf
  fi

)
