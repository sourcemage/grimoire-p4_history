(

  if    spell_installed  gettext
  then  NLS="enable_nls=1"
  fi

  make PREFIX=/usr $NLS  &&
  prepare_install        &&
  make    install PREFIX=/usr $NLS            

) > $C_FIFO 2>&1
