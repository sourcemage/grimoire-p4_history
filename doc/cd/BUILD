(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`               &&
    INSTALLDIR=$TEXMF/tex/macros/cd                 &&

    yes | tex  cd.ins                               &&

    prepare_install                                 &&
    
    mkdir -p  $INSTALLDIR                           &&
    mkdir -p  /usr/doc/$SPELL                       &&
  
    cp  cd.cls       $INSTALLDIR                    &&
    cp  cd.pdf       /usr/doc/$SPELL                &&
    cp  cd.dvi       /usr/doc/$SPELL                &&
    cp  README       /usr/doc/$SPELL                &&
    cp  example.dat  /usr/doc/$SPELL

) > $C_FIFO 2>&1
