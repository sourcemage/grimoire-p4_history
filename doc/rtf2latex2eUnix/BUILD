(

  cd Unix                                                                   &&
  ./configure --prefix=/usr                                                 \
              --host=pc-linux-gnu                                           \
			  $OPTS                                                         &&
  sedit "s/\/usr\/local\/rtf2latex2e/\/usr\/share\/rtf2latex2e/g" Makefile  &&
  make                                                                      &&
  prepare_install                                                           &&
  make install

) > $C_FIFO 2>&1
