(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    latex $SPELL.ins                                    &&

    latex  --interaction batchmode   $SPELL.dtx         &&
    latex  --interaction batchmode   $SPELL.dtx         &&
    latex  --interaction batchmode   $SPELL.dtx         &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL                  &&
    mkdir  -p  /usr/doc/$SPELL                          &&

    cp  $SPELL.sty  $TEXMF/tex/latex/$SPELL/            &&
    cp  $SPELL.cfg  $TEXMF/tex/latex/$SPELL/            &&

    cp  *.dvi       /usr/doc/$SPELL

) > $C_FIFO 2>&1                                        &&

if  [  "$A4_PAPER"  ==  "y"  ]; then
    
    echo  "\ExecuteOptions{a4paper}" > `kpsewhich geometry.cfg`
fi
