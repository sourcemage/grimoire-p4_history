(

  ./configure  $OPTS -d  &&
  make                   &&
  prepare_install        &&
  make    install  &&

  if [ ! -h /usr/share/man/whatis ]; then
    touch /var/cache/whatis &&
    mv -f /usr/share/man/whatis /var/cache/whatis &&
    ln -fs /var/cache/whatis /usr/share/man/whatis
  fi

  if  spell_installed  less;
    then
    sedit "s/PAGER		\/bin\/less -is/PAGER		\/bin\/less -isR/" /usr/share/misc/man.conf
  fi


) > $C_FIFO 2>&1
