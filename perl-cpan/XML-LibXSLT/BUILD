(
	perl Makefile.PL &&
	make             &&
#	the following always fails on test 07blankdoc
#	make test        &&
	prepare_install  &&
	make install
) > $C_FIFO 2>&1
