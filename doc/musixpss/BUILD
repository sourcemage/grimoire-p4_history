(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    gcc musixpss.c -o musixpss                          &&

    prepare_install                                     &&
    
    cp  musixpss     /usr/bin                           &&
    cp  *.tex       $TEXMF/tex/generic/musixtex

) > $C_FIFO 2>&1
