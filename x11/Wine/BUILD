(

  if    [  "$OPENGL"  ==  "y"  ]
  then  OPTS="$OPTS  --enable-opengl"
  fi

  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
    
  make    depend                     &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
