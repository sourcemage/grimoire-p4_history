(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL                  &&
    cp  *      $TEXMF/tex/latex/$SPELL/

) > $C_FIFO 2>&1
