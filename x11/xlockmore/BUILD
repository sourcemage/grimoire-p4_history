  if  spell_ok  linux-pam;  then
    ENABLE_PAM="--enable-pam"
  fi

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $ENABLE_PAM           \
               $OPTS                 &&
  make
