(
  			# To get around a redefinition of crypt in des.h
			#
  perl  Makefile.PL  -- DEFINE='-DPERL5'  &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
