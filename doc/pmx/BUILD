(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                   &&

    sedit "s/\/usr\/local/\/usr/g" Makefile             &&

    make

    prepare_install                                     &&
    make    install                                     &&

    mkdir -p     $TEXMF/tex/pmx                         &&
    cp  pmx.tex  $TEXMF/tex/pmx

) > $C_FIFO 2>&1
