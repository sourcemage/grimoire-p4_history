(

    TEXMF=`kpsetool -v '$TEXMFLOCAL'`               &&

    gcc -o musixflx systems/c-source/musixflx.c     &&

    prepare_install                                 &&

    cp  -r  musixflx  /usr/bin                      &&
    cp  -r  $SCRIPT_DIRECTORY/musixtex.sh /usr/bin  &&
    cp  -r  mf        $TEXMF/fonts/source/musixtex  &&
    cp  -r  tfm       $TEXMF/fonts/tfm/musixtex     &&
    cp  -r  tex       $TEXMF/tex/musixtex   &&
    cp  -r  doc       /usr/doc/$SPELL

) > $C_FIFO 2>&1
