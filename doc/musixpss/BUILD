(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    gcc musixpss.c -o musixpss                          &&

    prepare_install                                     &&
    
    cp  musixpss     /usr/bin                           &&
    cp  *.tex       $TEXMF/tex/musixtex

) > $C_FIFO 2>&1
