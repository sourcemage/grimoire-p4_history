(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`                       &&

    gcc $OPTS -o musixflx systems/c-source/musixflx.c       &&

    prepare_install                                         &&

    mkdir -p $TEXMF/fonts/tfm/musixtex                      &&
    mkdir -p $TEXMF/fonts/source/musixtex                   &&
    mkdir -p $TEXMF/tex/musixtex	  		    &&

    cp  -r  musixflx  /usr/bin                              &&
    cp  -r  $SCRIPT_DIRECTORY/musixtex    /usr/bin          &&
    cp  -r  $SCRIPT_DIRECTORY/musixtexrc  /etc              &&
    cp      $SCRIPT_DIRECTORY/musixtex.1.gz  /usr/man/man1  &&
    cp  -r  mf        $TEXMF/fonts/source/musixtex          &&
    cp  -r  tfm       $TEXMF/fonts/tfm/musixtex             &&
    cp  -r  tex       $TEXMF/tex/musixtex                   &&
    cp  -r  doc       /usr/doc/$SPELL

) > $C_FIFO 2>&1
