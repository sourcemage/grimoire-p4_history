(

    TEXMF=`kpsetool -v '$TEXMF'`                        &&
    TEXMF=`echo $TEXMF | sed -e "s/\!*//"`              &&

    mv makefile makefile.old                            &&

    sed -e 's/TEXMFROOT=\$(HOME)\/texmf/                \
            TEXMFROOT=\/usr\/share\/texmf/g'            \
    < makefile.old > makefile                           &&

    make    all                                         &&
    
    prepare_install                                     &&
    
    mkdir  -p  $TEXMF/fonts/pk/public/skak/             &&
    mkdir  -p  $TEXMF/fonts/gf/public/skak/             &&
    mkdir  -p  $TEXMF/fonts/tfm/public/skak/            &&
    mkdir  -p  $TEXMF/fonts/source/public/skak/         &&
    mkdir  -p  $TEXMF/tex/latex/skak/                   &&
    mkdir  -p  /usr/doc/$SPELL                          &&
    
    cp  *.600pk    $TEXMF/fonts/pk/public/skak/         &&
    cp  *.600gf    $TEXMF/fonts/gf/public/skak/         &&
    cp  *.tfm      $TEXMF/fonts/tfm/public/skak/        &&
    cp  mf/*.mf    $TEXMF/fonts/source/public/skak/     &&
    cp  tex/*      $TEXMF/tex/latex/skak/               &&
    cp  *.ps       /usr/doc/$SPELL

) > $C_FIFO 2>&1
