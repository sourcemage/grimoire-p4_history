  PREFIX=${INSTALL_ROOT}/usr/firebird           &&
  OPTS="${OPTS} ${FB_SS} ${FB_EDIT}"            &&

  NOCONFIGURE=1 . ./autogen.sh			&&
  ./configure 				\
	--prefix=$PREFIX 		\
	$OPTS					&&
  make                                          &&
# prepare an install image
  cd gen                                        &&
  ./install/makeInstallImage.sh

