(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`        &&
    rm *.o                                   &&
    sedit "s/\/usr\/local/\/usr/g" Makefile  &&
    sedit "s/-O2/$CFLAGS/" Makefile          &&
    make                                     &&
    prepare_install                          &&
    make    install                          &&
    mkdir -p     $TEXMF/tex/pmx              &&
    cp  pmx.tex  $TEXMF/tex/pmx

) > $C_FIFO 2>&1
