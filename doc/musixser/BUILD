(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    prepare_install                                     &&
    
    cp  musixser.tex    $TEXMF/tex/musixtex     &&
    mkdir   -p          /usr/doc/$SPELL                 &&
    cp  mxserdoc.tex    /usr/doc/$SPELL                 &&
    cp  mxserdoc.dvi    /usr/doc/$SPELL

) > $C_FIFO 2>&1
