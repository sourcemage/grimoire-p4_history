(

  #  the following export was to deal with a zvt compilation problem.
  export  CFLAGS="$CFLAGS -I/usr/include/gnome-1.0"

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --without-gtk      \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install		  &&

  if spell_installed gnome-libs ; then

    make clean                    &&
    ./configure --prefix=/usr     \
                --sysconfdir=/etc \
                --with-gtk        \
                $OPTS             &&
    make                          &&
    make install
  fi

) > $C_FIFO 2>&1
