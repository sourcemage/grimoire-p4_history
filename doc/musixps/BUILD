(

    TEXMF=`kpsetool -v '$TEXMFMAIN'`                    &&
    TEXMFLOCAL=`kpsetool -v '$TEXMFLOCAL'`              &&

    prepare_install                                     &&
    
    cp  -r  pfb/  $TEXMFLOCAL/fonts/type1/musixtex/     &&

    cp  dvips/musix.map    $TEXMF/dvips/config/         &&
    cp  dvipdfm/musix.map  $TEXMFLOCAL/dvipdfm/config/

) > $C_FIFO 2>&1
