(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&
    
    mkdir  -p  /usr/doc/$SPELL                          &&

    cd latex

    latex $SPELL.ins                                    &&

    latex  --interaction batchmode   $SPELL.dtx         &&
    latex  --interaction batchmode   $SPELL.dtx         &&

    cd ..

    prepare_install                                     &&
    
    cp  -r  mf/  $TEXMF/fonts/source/public/$SPELL      &&
    cp  -r  tfm/ $TEXMF/fonts/tfm/public/$SPELL         &&
    cp      latex/*.fd $TEXMF/tex/latex/$SPELL          &&
    cp      latex/*.dvi /usr/doc/$SPELL

) > $C_FIFO 2>&1
