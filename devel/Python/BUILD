(

  if  [  "$TK"  ==  "y"  ];  then
    patch -p1 < $SCRIPT_DIRECTORY/Python-tk.patch
  fi

  ./configure  --prefix=/usr            &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1

