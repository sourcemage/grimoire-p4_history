(
    
    pwd
    texi2dvi  cookbook.texinfo                  &&
    dvips     cookbook.dvi  -o  cookbook.ps     &&

    prepare_install                             &&

    mkdir  -p        /usr/share/doc/$SPELL      &&
    cp  cookbook.ps  /usr/share/doc/$SPELL      &&

    install     `echo info/*`  /usr/info        &&
    install-info    --info-dir=/usr/info        \
                  /usr/info/cookbook.info


) > $C_FIFO 2>&1
