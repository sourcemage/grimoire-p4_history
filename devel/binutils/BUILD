(

  mkdir  buildit
  cd     buildit

  ../configure  --host=$BUILD  \
                --prefix=/usr  \
 		$OPTS	       &&
  make                         &&
  message  "${MESSAGE_COLOR}Preparing to install"    \
           "${SPELL_COLOR}${SPELL}${DEFAULT_COLOR}"  &&
  make  install

) > $C_FIFO 2>&1
