(
  groupadd  gdm           2>/dev/null
  useradd   gdm  -g  gdm  2>/dev/null


  if    spell_installed  Linux-PAM;  then  SCHEME="pam"
  elif  spell_installed  shadow;     then  SCHEME="shadow"
                                   else  SCHEME="auto"
  fi

  OPTS="$OPTS --enable-authentication-scheme=$SCHEME"

  LDFLAGS="$LDFLAGS -L/usr/X11R6/lib"

  patch  -p 1  <  $SCRIPT_DIRECTORY/dont-install-broken-pam-config.patch  &&

  #default_build                      &&

  ./configure   --build=$BUILD       \
                --prefix=/usr        \
                --sysconfdir=/etc    \
                --localstatedir=/var \
                $OPTS                &&

  sedit 's#$(LINK)#$(LINK) $(LIBS)#' daemon/Makefile   &&
  make            &&
  prepare_install &&
  make install    &&

  mkdir  -p           /var/gdm       &&
  chown  -R  gdm:gdm  /var/gdm       &&
  chmod  750          /var/gdm
)  > $C_FIFO  2>&1
