(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    prepare_install                                     &&

    mkdir  -p  $TEXMF/texdoctk                          &&

    cp  texdoctk  /usr/bin                              &&
    cp  texdoc-102.dat     $TEXMF/texdoctk              &&
    cp  texdocrc.defaults  $TEXMF/texdoctk              &&
    cp  texdoctk.1         /usr/man/man1

) > $C_FIFO 2>&1
