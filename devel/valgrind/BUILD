(

  if [ "$CVS" = "yes" ]; then
    ./autogen.sh
  fi  &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  make    check                      &&
  # prepare_install fails because valgrind provides a libpthread.so that gets
  # used wrongly because of the save_libraries LD_LIBRARY_PATH magic
  # prepare_install                    &&
  message  "${MESSAGE_COLOR}Preparing to install" \
           "${SPELL_COLOR}${SPELL}${DEFAULT_COLOR}"
  dispel --notriggers --nosustain $SPELL  &&
  make    install

) > $C_FIFO 2>&1
