(

  sedit "130,134D" Makefile  #Prevent launch of qiv on install.
  make  PREFIX=/usr &&
  prepare_install   &&
  make  PREFIX=/usr  install

) > $C_FIFO 2>&1
