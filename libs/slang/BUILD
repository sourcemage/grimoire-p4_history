(

  ./configure  --build=$BUILD  \
               --prefix=/usr   &&
  make  elf                    &&
  prepare_install              &&
  make    install-elf          &&
  make    install-links

) > $C_FIFO 2>&1
