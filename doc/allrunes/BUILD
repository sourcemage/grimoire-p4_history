(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    latex $SPELL.ins                                    &&

    latex  --interaction batchmode   $SPELL.dtx         &&
    latex  --interaction batchmode   $SPELL.dtx         &&
    makeindex -s gind.ist $SPELL                        &&
    latex  --interaction batchmode   $SPELL.dtx         &&
    latex  --interaction batchmode   $SPELL.dtx         &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/fonts/source/public/$SPELL        &&
    mkdir  -p  $TEXMF/tex/latex/$SPELL                  &&
    mkdir  -p  /usr/doc/$SPELL                          &&

    cp  *.mf  $TEXMF/fonts/source/public/$SPELL         &&

    cp  *.fd        $TEXMF/tex/latex/$SPELL             &&
    cp  $SPELL.sty  $TEXMF/tex/latex/$SPELL

    cp  *.dvi       /usr/doc/$SPELL                     &&
    cp  ar_demo.*   /usr/doc/$SPELL                     &&
    cp  README.txt  /usr/doc/$SPELL

) > $C_FIFO 2>&1
