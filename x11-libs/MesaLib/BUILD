(
mkdir  ggi  ggi/demos  ggi/ggiglut                     	&&
touch  ggi/demos/Makefile.in  ggi/ggiglut/Makefile.in  	&&
###5.0.2 hacks
#sedit '/AM_PROG_LIBTOOL/i\
#\AM_PROG_AS\' configure.in                              &&
#sedit '/INCLUDES/i\
#\INCLUDES=$(DEFAULT_INCLUDES)\' src/GGI/Makefile.am             &&
#sedit "s/CXXFLAGS/AM_CXXFLAGS/" si-glu/libnurbs/interface/Makefile.am &&
#sedit "s/CXXFLAGS/AM_CXXFLAGS/" si-glu/libnurbs/internals/Makefile.am &&
#sedit '/AM_CXXFLAGS/i\
#\AM_CXXFLAGS=$(CXXFLAGS)\' si-glu/libnurbs/interface/Makefile.am   &&
#sedit '/AM_CXXFLAGS/i\
#\AM_CXXFLAGS=$(CXXFLAGS)\' si-glu/libnurbs/internals/Makefile.am   &&
#sedit '1 i\
#\/\*\' src/GGI/include/ggi/mesa/debug.h                 &&
#sedit '1 i\
#\/\*\' src/GGI/display/fbdev_visual.c                   &&
#sedit '1 i\
#\/\*\' src/GGI/display/fbdev_mode.c                     &&
#aclocal                                                 &&
#autoconf                                                &&
#automake --add-missing --gnu                            &&
#ln -sf $PWD/src/glapioffsets.h $PWD/src/X86/            &&
###end 5.0.2 hack
default_build						&&
# Install SGI's GLU 1.3 implementation (Mesa contains 1.1/1.2 only)
cd  ${INSTALL_ROOT}/usr/lib                   		&&
unpack  ${SOURCE2}  ${MD5[1]}

)  >  ${C_FIFO}  2>&1

