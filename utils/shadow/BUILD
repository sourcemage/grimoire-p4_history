(

  if  spell_installed  Linux-PAM;  then
    WITH_LIBPAM="--with-libpam"
  fi

#               --enable-shared       \
#  is it broken or what it won't compile shared libraries?
#  I checked the shadow CVS 20010107 and it's broke, too
#  but at least has a fix for what the above patch fixes.


#  Every new version of shadow arrives with bugs.  :(
  sedit  "s/-lpam_misc/-lpam_misc -lpam/"  configure

  sedit  "s/ln -s/ln -sf/g"  configure
  sedit  "s/ln -s/ln -sf/g"  aclocal.m4

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $WITH_LIBPAM          \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  && (

  cd  etc

  [  -e  /etc/limits           ]  ||  cp  limits            /etc
  [  -e  /etc/login.access     ]  ||  cp  login.access      /etc
  [  -e  /etc/login.defs.linux ]  ||  cp  login.defs.linux  /etc
  [  -e  /etc/login.defs       ]  ||  cp  login.defs.linux  /etc/login.defs
  [  -e  /etc/defaults         ]  ||  mkdir                 /etc/defaults

  cp  $SCRIPT_DIRECTORY/adduser  /usr/sbin
  cp  $SCRIPT_DIRECTORY/deluser  /usr/sbin

)
