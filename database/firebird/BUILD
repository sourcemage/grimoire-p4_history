# Classic Server install needs services or xinet.d
# Super Server install needs init.d
# at present the build only works for everything in one directory 
# tree /usr/firebird

  PREFIX=${INSTALL_ROOT}/usr/firebird		&&
# fix compiler flags
  sed -i -e \
"s/-O3 -march=i586 -mcpu=i686//;s/-ggdb/$CFLAGS/;s/-shared/-shared $LDFLAGS/" \
       -e "s/-fno-builtin//;s/-fno-omit-frame-pointer//"      \
	builds/posix/prefix.linux		&&

# make this compatible with smgl init system
  if [ "$USECVS" == "yes" ];then
    SCRIPT=builds
  else
    SCRIPT=src
  fi                                            &&
  FF=$SCRIPT/install/arch-specific/linux/misc/changeDBAPassword.sh.in&&
  sed -e "s:rc\.d/::;s:d/f:d/runlevels/\%3/f:" -i $FF &&

  echo install=$INST				&&

  NOCONFIGURE=1 . ./autogen.sh			&&
  ./configure 				\
	--prefix=$PREFIX 		\
	--with-editline			\
	$OPTS					&&
  make
