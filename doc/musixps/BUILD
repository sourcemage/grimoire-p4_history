(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    prepare_install                                     &&
    
    cp  -r  pfb/  $TEXMF/fonts/type1/musixtex/          &&

    cp  dvips/musix.map    $TEXMF/dvips/config/         &&
    cp  dvipdfm/musix.map  $TEXMF/dvipdfm/config/

) > $C_FIFO 2>&1
