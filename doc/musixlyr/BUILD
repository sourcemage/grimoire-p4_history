(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`          &&

    prepare_install                            &&
    cp  tex/musixlyr.tex  $TEXMF/tex/musixtex  &&
    cp  doc/musixlyr.txt  /usr/doc/$SPELL      &&
    cp  doc/mxlyrdoc.tex  /usr/doc/$SPELL      &&
    cp  doc/mxlyrdoc.dvi  /usr/doc/$SPELL      &&
    cp  README.musixlyr   /usr/doc/$SPELL

) > $C_FIFO 2>&1
