(
  rm -f docs/CHANGELOG 	&&
  cp WHATSNEW docs/CHANGELOG &&
  sedit 's/usr\/local/usr/' imcom &&
  sedit 's/usr\/local/usr/' Makefile &&
  prepare_install                   &&
  make  install 
) > $C_FIFO 2>&1

