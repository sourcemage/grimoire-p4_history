
if    [  -f  $CONFIG_CACHE/host.def  ]
then  cp     $CONFIG_CACHE/host.def  config/cf/host.def
fi                                               &&
if [ -f config/cf/host.def ]
  then sedit s"/-Os//g" config/cf/host.def
fi                                               &&
message  "Building XFree86 takes a very long time."

( 
if    (echo $CFLAGS | grep -q -- "-Os"); then
    export CFLAGS="-O2 ${CFLAGS//-Os/}"
fi                                               &&

  #disable bad libs
cat <<__EOF__ >config/cf/site.def

#define DefaultCCOptions      $CFLAGS
#define DefaultGcc2i386Opt    $CFLAGS
#define LibraryCDebugFlags    $CFLAGS
#define DefaultCDebugFlags    $CFLAGS
#define ProjectRoot           /usr/X11R6
#define HasShm                   YES
#define HasZlib                  YES
#define HasFreetype2             YES
#define BuildFreetype2Library     NO
#define HasExpat                 YES
#define HasFontconfig            YES

#define	BuildServer		  NO
#define BuildFontServer		  NO
#define BuildXAServer		  NO
#define BuildLBX		  NO
#define BuildXF86VidModeLibrary	  NO
#define BuildPlugin		  NO
#define BuildCID		  NO
#define BuildDPSClients		  NO
#define BuildServersOnly	  YES
#define	BuildClients		  NO

#define BuildFonts                NO
#define BuildSpeedoFonts          NO
#define	BuildType1Fonts           NO
#define BuildCIDFonts             NO
#define	BuildTTFonts              NO
#define	BuildPexExt               NO

#define BuildMiscDocs             NO
#define BuildSpecsDocs            NO

#define BuildXaw6                 YES
#define	BuildXKB                  NO
#define BuildLBX                  NO

#define BuildXIElib		YES
#define BuildPexLib		YES
#define BuildXF86MiscLibrary	YES
#define BuildXvLibrary		YES
#define BuildXResLibrary	YES
#define BuildGLXLibrary		YES
#define BuildGLwLibrary		YES
#define BuildGLULibrary		YES
#define BuildRenderLibrary	YES
#define BuildXF86MiscLibrary	YES
#define BuildRandRLibrary	YES
#define BuildXTrapLibrary	YES
#define BuildX11Lib		YES
#define BuildXprintLib		YES
#define BuildXextLib		YES
#define BuildThreadStubLibrary	YES
#define BuildLibraries		YES

#define DriDrivers              /**/
#define BuildXF86DRM            NO

__EOF__
  # end 

  cd config/util                                   &&
  make -f Makefile.ini lndir                       &&
  cp lndir $SOURCE_DIRECTORY.bld/                  &&
  cd $SOURCE_DIRECTORY.bld                         &&
  ./lndir ../xc/                                   &&

  make  World                                      &&
  prepare_install                                  &&
  #### the following is needed for pkgconfig to find the .pc files
  mkdir  -p  /usr/X11R6/lib                                      &&
  ln -sf  /usr/lib/pkgconfig  /usr/X11R6/lib                     &&
  make  install                                    &&
  sedit 's/die/print/' ./config/util/mkhtmlindex.pl &&
  make  install.man


) > $C_FIFO 2>&1  &&  (
  rm     -f  /usr/X11R6/include/zlib.h
  rm     -f  /usr/X11R6/lib/libz.a

  if  [  !  -e                    /usr/bin/X11  ];  then
    ln      -sf   /usr/X11R6/bin  /usr/bin/X11
  fi

  if  [  !  -e          /usr/X11  ];  then
    ln      -sf  X11R6  /usr/X11
  fi

  if  [  !  -e                         /usr/include/X11  ];  then
    ln      -sf  ../X11R6/include/X11  /usr/include/X11
  fi
  
  if  [  !  -e                         /usr/include/GL  ];  then
    ln      -sf  ../X11R6/include/GL  /usr/include/GL
  fi

  if  [  !  -e                     /usr/lib/X11  ];  then
    ln      -sf  ../X11R6/lib/X11  /usr/lib/X11
  fi

)
