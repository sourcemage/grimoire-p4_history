(
   
    cp -R /usr/share/texmf/tex/latex/config /tmp                &&
    cd    /tmp/config                                           &&
    tex -ini -progname=latex latex.ini
    mv latex.fmt /usr/share/texmf/web2c                         &&
    rm -r /tmp/config                                           &&

    cd $BUILD_DIRECTORY/$SOURCE_DIRECTORY                       &&

    make  jadetex.fmt                                           &&
    make  pdfjadetex.fmt                                        &&
    prepare_install                                             &&
    make install                                                &&

    if [ ! -e /usr/bin/jadetex ]; then
    ln  -s  /usr/bin/tex    /usr/bin/jadetex
    fi                                                          &&

    if [ ! -e /usr/bin/pdfjadetex ]; then
    ln  -s  /usr/bin/pdftex /usr/bin/pdfjadetex
    fi

) > $C_FIFO 2>&1

