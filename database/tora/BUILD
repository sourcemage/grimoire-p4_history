#--enable-opt-flag=
  sedit "s/-g//;s/-O3/${CFLAGS}/;/^LFLAGS_GLOB/d;s/LFLAGS_GLOB/${LDFLAGS}/" \
         configure.pl               &&
#  default_build
  ./configure 	--prefix=${INSTALL_ROOT}/usr \
		--without-oracle \
                $OPTS                &&
  make                  
