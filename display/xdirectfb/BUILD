
message  "Building xdirectfb takes a very long time."

( 
  rm -f config/cf/host.def                                                          &&

  if  (echo $CFLAGS | grep -q -- "-Os"); then
    export CFLAGS="-O2 ${CFLAGS//-Os/}"
  fi                                                                                &&

  if  spell_installed  Linux-PAM
  then  echo  "#define  HasPam  YES"  >>  config/cf/site.def
  fi                                                                                &&

  ### xdirectfb specific stuff
  cp $SOURCE_DIRECTORY/programs/Xserver/hw/xfree86/xf86Version.h $SOURCE_DIRECTORY/ &&
  cp $SOURCE_DIRECTORY/programs/Xserver/hw/xfree86/xf86Date.h $SOURCE_DIRECTORY/    &&
cat <<__EOF__ >config/cf/host.def

#define DefaultCCOptions      $CFLAGS
#define DefaultGcc2i386Opt    $CFLAGS
#define LibraryCDebugFlags    $CFLAGS
#define DefaultCDebugFlags    $CFLAGS
#define HasShm                  YES
#define HasZlib                 YES
#define HasFreetype2            YES
#define HasFontconfig           YES
#define BuildFreetype2Library   NO
#define HasExpat                YES
#define XDirectFBServer         YES

__EOF__
  # end 

  cd config/util                                                 &&
  make -f Makefile.ini lndir                                     &&
  cp lndir $SOURCE_DIRECTORY.bld/                                &&
  cd $SOURCE_DIRECTORY.bld                                       &&
  ./lndir ../xc/                                                 &&
  ### Fix Bug #3486, which stops the build process
  ln -sf $SOURCE_DIRECTORY.bld/lib/font/builtins $SOURCE_DIRECTORY.bld/lib/font/builtins/unshared &&

  make World

  ### Some IMAKE issues from the XDirectFB patches need fixing
  ln -sf $SOURCE_DIRECTORY/include/extensions/Xv.h $SOURCE_DIRECTORY.bld/exports/include/X11/extensions/  &&
  sedit "s/STD\_INCLUDES =/& \-I greeter\//" $SOURCE_DIRECTORY.bld/programs/xdm/Makefile                  &&
  man2html $SOURCE_DIRECTORY.bld/doc/man/Xext/XTransparency._man > $SOURCE_DIRECTORY.bld/doc/man/Xext/XTransparency.3x.html  &&
  ### Start compiling where the prior left off
  make                                                                                               &&
  prepare_install                                                                                    &&

  ### the following is needed for pkgconfig to find the .pc files
  mkdir  -p  ${INSTALL_ROOT}/usr/X11R6/lib                                                           &&
  ln -sf  ${INSTALL_ROOT}/usr/lib/pkgconfig  ${INSTALL_ROOT}/usr/X11R6/lib                           &&
  make  install                                                                                      &&
  ### more IMAKE foobars
  mkdir -p ${INSTALL_ROOT}/usr/X11R6/lib/X11/doc/html/                                               &&
  install -c -m 0444 $SOURCE_DIRECTORY.bld/doc/man/Xext/XTransparency.3x.html                        \
  ${INSTALL_ROOT}/usr/X11R6/lib/X11/doc/html/XTransparency.3.html                                    &&
  cp $SOURCE_DIRECTORY/config/cf/directfb.cf ${INSTALL_ROOT}/usr/X11R6/lib/X11/config/               &&
  cp $SOURCE_DIRECTORY/include/extensions/xf86vm* ${INSTALL_ROOT}/usr/X11R6/include/X11/extensions/  &&
  ### normal
  make  install.man                                                                                  &&
  mkdir  -p  /usr/X11R6/include/GL

) > $C_FIFO 2>&1  &&  (

  rm     -f  /usr/X11R6/include/zlib.h
  rm     -f  /usr/X11R6/lib/libz.a

  if  [  !  -e                      /etc/skel/.xsession  ];  then
    cp  $SCRIPT_DIRECTORY/xsession  /etc/skel/.xsession
  fi

  if  [  !  -e                    /usr/bin/X11  ];  then
    ln      -sf   /usr/X11R6/bin  /usr/bin/X11
  fi

  if  [  !  -e          /usr/X11  ];  then
    ln      -sf  X11R6  /usr/X11
  fi

  if  [  !  -e                         /usr/include/X11  ];  then
    ln      -sf  ../X11R6/include/X11  /usr/include/X11
  fi

  if  [  !  -e                     /usr/lib/X11  ];  then
    ln      -sf  ../X11R6/lib/X11  /usr/lib/X11
  fi

)

