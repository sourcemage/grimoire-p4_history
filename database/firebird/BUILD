# at present the build only works for everything in one directory 
# tree /usr/firebird

  local SCRIPT                           &&
  PREFIX=${INSTALL_ROOT}/usr/firebird		&&
# fix compiler flags
#  if [ `g++ -dumpversion | cut -c -3` == 3.4 ]; then
#    CFLAGS="${CFLAGS//-O3/}"
#    CXXFLAGS="${CXXFLAGS//-O3/}" 
#  fi                                            &&
  sed -i -e \
"s/-O3 -march=i586 -mcpu=i686//;s/-ggdb//;s/-shared/-shared $LDFLAGS/" \
       -e "s/-fno-builtin//;s/-fno-omit-frame-pointer//"      \
	builds/posix/prefix.linux		&&

# make this compatible with smgl init system
  if [ "$WHICH" == "cvs" ];then
    SCRIPT=builds
  else
    SCRIPT=src
  fi                                            &&
  sed -e "s:rc\.d/::;s:d/f:d/runlevels/\%3/f:" -i \
     $SCRIPT/install/arch-specific/linux/misc/changeDBAPassword.sh.in&&

# Classic Server install needs services or xinet.d
# Super Server install needs init.d
  if `grep -q "^INITD" ${SPELL_CONFIG}`;then
    OPTS="${OPTS}  --enable-superserver"
    message building SuperServer
  else
    message building Classic Server
  fi                                            &&

  NOCONFIGURE=1 . ./autogen.sh			&&
  ./configure 				\
	--prefix=$PREFIX 		\
	--with-editline			\
	$OPTS					&&
  make
