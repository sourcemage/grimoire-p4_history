spell_present()  {
  spell_installed  $1  ||
  spell_held       $1
}


(

  if  !  spell_present  teTeX  ||
      !  spell_present  linuxdoc-tools;  then

    cp   Makefile.am                      Makefile.am.original
    sed  's/cd doc && $(MAKE) ps//'       Makefile.am.original  |
    sed  's/cd doc && $(MAKE) pdf//'                            |
    sed  's/cd doc && $(MAKE) html//'  >  Makefile.am

  fi

  ./configure  --build=$BUILD           \
               --host=$BUILD            \
               --prefix=/usr            \
               --sysconfdir=/etc        \
               --with-included-gettext  \
               $OPTS                    &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
