(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    latex $SPELL.ins                                    &&

    latex $SPELL.dtx                                    &&
    latex $SPELL.dtx                                    &&
    latex $SPELL.dtx                                    &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL/                 &&
    mkdir  -p  /usr/doc/$SPELL                          &&

    cp  $SPELL.cls      $TEXMF/tex/latex/$SPELL         &&
    cp  *.pdf           /usr/doc/$SPELL                 &&
    cp  *.dvi           /usr/doc/$SPELL                 &&
    cp  avery*          /usr/doc/$SPELL                 &&
    cp  samplecards.tex /usr/doc/$SPELL                 &&
    cp  COPYING         /usr/doc/$SPELL                 &&
    cp  README          /usr/doc/$SPELL   

) > $C_FIFO 2>&1
