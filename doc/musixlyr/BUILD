(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                           &&

    prepare_install                                             &&
    
    cp  musixlyr.tex  $TEXMF/tex/musixtex                       &&
    cp  mxlyrdoc.tex  /usr/doc/$SPELL                           &&
    cp  README        /usr/doc/$SPELL

) > $C_FIFO 2>&1
