(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    yes "" | latex $SPELL.ins                           &&
    yes "" | latex $SPELL.ins                           &&
    latex $SPELL.dtx                                    &&
    latex $SPELL.dtx                                    &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL/                 &&
    mkdir  -p  /usr/doc/$SPELL                          &&

    cp  *.sty           $TEXMF/tex/latex/$SPELL         &&
    cp  *.pdf           /usr/doc/$SPELL                 &&
    cp  *.dvi           /usr/doc/$SPELL                 &&
    cp  README          /usr/doc/$SPELL   

) > $C_FIFO 2>&1
