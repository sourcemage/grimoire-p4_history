(
	./configure  --prefix=${INSTALL_ROOT}/usr                    \
               --sysconfdir=${INSTALL_ROOT}/etc/gnomemeeting         \
	       $OPTS					             &&
	make             &&
	prepare_install  &&
	make install     
) > $C_FIFO 2>&1
