(
  mkdir buildit
  cd buildit

  ../configure  --host=$BUILD  \
               --prefix=/usr  &&
  make  tooldir=/usr          &&
  message  "${MESSAGE_COLOR}Preparing to install"  \
           "${SPELL_COLOR}${SPELL}${DEFAULT_COLOR}"  &&
  make  tooldir=/usr install  &&
  make  tooldir=/usr install-info

) > $C_FIFO 2>&1
