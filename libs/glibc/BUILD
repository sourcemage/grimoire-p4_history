#
# bug#5570 ccache sometimes has trouble correctly recognising minor differences 
# in configurations and doesn't force recompile when it should. This stops it from
# using the old cache entries.
#
export  CCACHE_RECACHE=true  &&
#
# End ccache fix
#

if  [  "$GLIBC_NPTL"  =  "y"  ];  then
  OPTS="$OPTS  --enable-add-ons=nptl  \
               --with-tls             \
               --enable-kernel=2.6"
else
  OPTS="$OPTS  --enable-add-ons=linuxthreads  \
               --enable-kernel=2.4"
fi  &&

if  !  echo  "$CFLAGS"  |  grep  -q  --  "-O";  then
  export  CFLAGS="$CFLAGS  -Os"
fi  &&

if  !  echo  "$CXXFLAGS"  |  grep  -q  --  "-O";  then
  export  CXXFLAGS="$CFLAGS -Os"
fi  &&

export  CFLAGS="${CFLAGS/-ffast-math/}"  &&
export  CC=gcc                           &&

#
# LD_LIBRARY_PATH includes $PWD bug 
#
unset  LD_LIBRARY_PATH  &&

#
# Setup sanitised glibc-kernel-headers for the glibc compile
#
persistent_add  GLIBC_ARCH  &&
if    [[  $(uname  -m)  =  *86_64    ]];  then
  GLIBC_ARCH=x86_64
elif  [[  $(uname  -m)  =  ppc       ]];  then
  GLIBC_ARCH=ppc
elif  [[  $(uname  -m)  =  *86       ]];  then
  GLIBC_ARCH=i386
elif  [[  $(uname  -m)  =  *sparc64  ]];  then
  #
  # If we're not compiling for 64-bit SPARC then we need to use the sparc
  # headers, not sparc64
  #
  if  grep  -q  --  "-m64"  $CFLAGS;  then
    GLIBC_ARCH=sparc64  &&
    export  CC=gcc64
  else
    GLIBC_ARCH=sparc
  fi  &&

  #
  # Fixes from Gentoo's 2.3.3.20040420-r2 ebuild
  #
  sedit  "s:CPPFLAGS += -DHAVE_INITFINI:CPPFLAGS += -DHAVE_INITFINI -fno-pie -fno-PIE:"  csu/Makefile
  export    CFLAGS="${CFLAGS/-fcall-used-g7/}"
  export  CXXFLAGS="${CFLAGS/-fcall-used-g7/}"
  export    CFLAGS="$CFLAGS  -fcall-used-g6"
  export  CXXFLAGS="$CFLAGS  -fcall-used-g6"
  export    CFLAGS="${CFLAGS/-mcpu=v9/}"
  export  CXXFLAGS="${CFLAGS/-mcpu=v9/}"
  export    CFLAGS="${CFLAGS/-mtune=ultrasparc/}"
  export  CXXFLAGS="${CFLAGS/-mtune=ultrasparc/}"
  export    CFLAGS="${CFLAGS/-mvis/}"
  export  CXXFLAGS="${CFLAGS/-mvis/}"
elif  [[  $(uname  -m)  =  *sparc    ]];  then
  GLIBC_ARCH=sparc  &&
  #
  # Fixes from Gentoo's 2.3.3.20040420-r2 ebuild
  #
  sedit  "s:CPPFLAGS += -DHAVE_INITFINI:CPPFLAGS += -DHAVE_INITFINI -fno-pie -fno-PIE:"  csu/Makefile
  export    CFLAGS="${CFLAGS/-fcall-used-g7/}"
  export  CXXFLAGS="${CFLAGS/-fcall-used-g7/}"
  export    CFLAGS="$CFLAGS  -fcall-used-g6"
  export  CXXFLAGS="$CFLAGS  -fcall-used-g6"
fi  &&

#
# 2.4 glibc-kernel-headers doesn't have a default "include" dir
#
if  [  "$GLIBC_NPTL"  =  "y"  ];  then
  cd  $GLIBC_HEADERS_DIR/include  &&
  ln  -sf  asm-$GLIBC_ARCH  asm
else
  cd  $GLIBC_HEADERS_DIR              &&
  ln  -sf  asm-generic  include       &&
  cd  include                         &&
  ln  -sf  ../asm-$GLIBC_ARCH  asm    &&
  ln  -sf  ../linux            linux
fi  &&
#
# End sanitised glibc-kernel-headers setup
#

#
# Change to where we're going to actually build
#
cd  $SOURCE_DIRECTORY.bld  &&

#
# Configure glibc to use the sanitised headers
# http://bugs.sourcemage.org/show_bug.cgi?id=7560
#
$SOURCE_DIRECTORY/configure  --host=$HOST                       \
                            --build=$BUILD                      \
                           --prefix=/usr                        \
                          --infodir=/usr/share/info             \
                           --mandir=/usr/share/man              \
                       --sysconfdir=/etc                        \
                             --with-elf                         \
                           --enable-shared                      \
                          --disable-profile                     \
                     --with-headers=$GLIBC_HEADERS_DIR/include  \
                                    $OPTS                       &&
make
