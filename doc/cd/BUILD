(

    TEXMF=`kpsetool -v '$TEXMF'`                    &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`          &&
    INSTALLDIR=$TEXMF/tex/macros/cd                 &&

    yes | tex  cd.ins                               &&

    prepare_install                                 &&
    
    mkdir -p  $INSTALLDIR                           &&
  
    cp  cd.cls       $INSTALLDIR                    &&
    cp  cd.pdf       /usr/doc/$SPELL                &&
    cp  cd.dvi       /usr/doc/$SPELL                &&
    cp  README       /usr/doc/$SPELL                &&
    cp  example.dat  /usr/doc/$SPELL

) > $C_FIFO 2>&1
