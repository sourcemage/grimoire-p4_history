(

  if    spell_installed  Linux-PAM;  then  SCHEME="pam"
  elif  spell_installed  shadow;     then  SCHEME="shadow"
                                     else  SCHEME="auto"
  fi

  AUTH_SCHEME="--enable-authentication-scheme=$SCHEME"

  groupadd  gdm           2>/dev/null
  useradd   gdm  -g  gdm  2>/dev/null

  patch  -p 0  <  $SCRIPT_DIRECTORY/gdm.patch  &&

  ./configure  --prefix=/usr         \
               --localstatedir=/var  \
               --sysconfdir=/etc     \
               $AUTH_SCHEME          &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  mkdir  -p           /var/gdm       &&
  chown  -R  gdm:gdm  /var/gdm       &&
  chmod  750          /var/gdm

) > $C_FIFO 2>&1
