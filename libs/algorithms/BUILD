(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    latex  --interaction batchmode   $SPELL.tex         &&
    latex  --interaction batchmode   $SPELL.tex         &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL                  &&
    mkdir  -p  /usr/doc/$SPELL                          &&

    cp  *.sty       $TEXMF/tex/latex/$SPELL             &&

    cp  *.dvi       /usr/doc/$SPELL 

) > $C_FIFO 2>&1
