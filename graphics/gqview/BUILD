(
 
  ./configure   --host=${HOST}              \
               --build=${BUILD}             \
              --prefix=${INSTALL_ROOT}/usr  \
          --sysconfdir=${INSTALL_ROOT}/etc  \
       --localstatedir=${INSTALL_ROOT}/var  \
                       $OPTS                 &&
	mv src/Makefile src/Makefile.old &&
	cat src/Makefile.old | sed -e 's/^LIBS = $/LIBS = $(LTLIBINTL)/' >src/Makefile &&
	make                               &&
	prepare_install                    &&
	make    install

) > $C_FIFO 2>&1
