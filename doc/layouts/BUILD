(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    latex $SPELL.ins                                    &&

    latex $SPELL.dtx                                    &&
    makeindex -s gind.ist $SPELL                        &&
    latex $SPELL.dtx                                    &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL/                 &&
    mkdir  -p  /usr/doc/$SPELL

    cp  $SPELL.sty  $TEXMF/tex/latex/$SPELL/            &&

    cp  *.dvi  /usr/doc/$SPELL                          &&
    cp  *.ps   /usr/doc/$SPELL                          &&
    cp  *.pdf  /usr/doc/$SPELL

) > $C_FIFO 2>&1
