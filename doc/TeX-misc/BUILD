(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/tex/latex/$SPELL                  &&
    cp  *      $TEXMF/tex/latex/$SPELL/

) > $C_FIFO 2>&1
