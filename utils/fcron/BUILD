(

  # Removed according to Bug #385
  # if    spell_installed  Linux-PAM
  # then  WITH_PAM="--with-pam=yes"
  # else  WITH_PAM="--with-pam=no"
  # fi
  WITH_PAM="--with-pam=no"

  EDITOR=`which $EDITOR  2>/dev/null`  ||
  EDITOR=`which nano`

  sedit  "s/-O2/$CFLAGS/"  configure

  ./configure  --prefix=/usr          \
               --with-answer-all=no   \
               $WITH_PAM              \
               --with-editor=$EDITOR  &&
  make                                &&
  prepare_install                     &&
  make    install

)  > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIRECTORY/fcron.sh  /etc/init.d

  ln     -sf  ../init.d/fcron.sh  /etc/rcS.d/S80fcron
  ln     -sf  ../init.d/fcron.sh  /etc/rc0.d/K20fcron
  ln     -sf  ../init.d/fcron.sh  /etc/rc6.d/K20fcron

  [ -e /etc/fcron.allow ]  ||  cp  files/fcron.allow  /etc
  [ -e /etc/fcron.deny  ]  ||  cp  files/fcron.deny   /etc

)
