  PREFIX=${INSTALL_ROOT}/usr/firebird           &&
  OPTS="${OPTS} ${FB_SS} --with-editline"       &&

  NOCONFIGURE=1 . ./autogen.sh			&&
  ./configure 				\
	--prefix=$PREFIX 		\
	--with-editline			\
	$OPTS					&&
  make                                          &&
# prepare an install image
  cd gen                                        &&
  ./install/makeInstallImage.sh

