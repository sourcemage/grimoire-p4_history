(

    TEXMF=`kpsetool -v '$TEXMF'`                    &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`          &&

    cc -o musixflx systems/c-source/musixflx.c      &&

    mkdir  -p  $TEXMF/fonts/source/musixtex         &&
    mkdir  -p  $TEXMF/fonts/tfm/musixtex            &&
    mkdir  -p  $TEXMF/tex/generic/musixtex          &&

    prepare_install                                 &&

    cp  -r  musixflx  /usr/bin                      &&
    cp  -r  mf        $TEXMF/fonts/source/musixtex  &&
    cp  -r  tfm       $TEXMF/fonts/tfm/musixtex     &&
    cp  -r  tex       $TEXMF/tex/generic/musixtex

) > $C_FIFO 2>&1
