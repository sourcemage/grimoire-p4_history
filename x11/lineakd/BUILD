(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    

) > $C_FIFO 2>&1  &&

( /usr/bin/lineakd -c  $KBRD || true)  &&

(message  "${MESSAGE_COLOR}You can now add '/usr/bin/lineakd -b'"  \
          "to ~/.xsession or put it in the list of 'startup"       \
          "programs' of your Window Manager${DEFAULT_COLOR}")
