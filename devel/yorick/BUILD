(

    make  prefix=/usr ysite     &&
    make  config                &&
    make                        &&

    prepare_install             &&

    make install
    ln -s /usr/lib/yorick/1.5/bin/* /usr/bin

) > $C_FIFO 2>&1
