(

  patch  -p1  <  $SCRIPT_DIRECTORY/connmon.patch
  spell_installed  "gtk+"  ||
      sedit  's/all-gconnmon$//'  src/Makefile

  make                                            &&

  prepare_install                                 &&
  cp  src/connmon/connmon  /usr/bin               &&
  if  [  -x  src/gconnmon/gconnmon  ]  ;  then
    cp  src/gconnmon/gconnmon  /usr/bin
  fi

) > $C_FIFO 2>&1
