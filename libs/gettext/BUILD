(
export CC=gcc   			&&
  ./configure  --build=$BUILD           \
               --host=$BUILD            \
               --prefix=/usr            \
               --sysconfdir=/etc        \
               --with-included-gettext  \
               $OPTS                    &&
  make                                  &&
if spell_installed teTeX ; 
then cd gettext-tools/doc &&
     make dvi  &&
     make ps   &&
     make pdf  &&
     cd -     
fi  &&
  prepare_install                       &&
  make    install                       &&
if spell_installed teTeX ; 
then cd gettext-tools/doc &&  
  make    install-pdf     &&
  make    install-ps      &&
  make    install-dvi
fi
) > $C_FIFO 2>&1
