(
    sedit "s:/usr/local/bin:${INSTALL_ROOT}/usr/bin:" Makefile  &&
    sedit 's$export cflags$#$' Makefile &&
    sedit 's/$(cflags)/$(CFLAGS)/' src/Makefile &&
    sedit 's/$(cc) $(objs)/$(cc) $(CFLAGS) $(objs)/' src/Makefile &&
    make  &&
    prepare_install &&
    make install
) > $C_FIFO 2>&1
