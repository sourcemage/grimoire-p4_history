install_drm()  {

  DRM_DIR="programs/Xserver/hw/xfree86/os-support/linux/drm/kernel"
  DRM_DEST="/lib/modules/`installed_version  linux`/kernel/drivers/char/drm"
  mkdir   -p                $DRM_DEST
  cp          $DRM_DIR/*.o  $DRM_DEST  2>/dev/null
  depmod  -a
  true

}


if    [  -f  $CONFIG_CACHE/host.def  ]
then  cp     $CONFIG_CACHE/host.def  config/cf/host.def
fi

message  "Building XFree86 takes a very long time."

( 
  #removing -Os from copied host.def bug#3694 and cleaning up $CFLAGS
  #leaving the original file untouched 
  #for when this gcc bug gets fixed (hgg09/08/03)
  #
  if [ -f config/cf/host.def ] 
  then sedit s"/-Os//g" config/cf/host.def 
  fi                                               &&
  if  !  (echo $CFLAGS | grep -q -- "-Os"); then
    export CFLAGS="-O2 ${CFLAGS//-Os/}"
  fi                                               &&

  if  spell_installed  Linux-PAM
  then  echo  "#define  HasPam  YES"  >>  config/cf/site.def
  fi                                               &&

  #
  #xfree86.org recommends building in a shadow tree [ it appears to fix a breakage 
  #with gcc not setting up the include paths properly, previously include files weren't found if 
  #xfree86 wasn't already installed (mentioned in bug#3694) (hgg09/08/03)]
  #
  cd config/util                                   &&
  make -f Makefile.ini lndir                       &&
  cp lndir $SOURCE_DIRECTORY.bld/                  &&
  cd $SOURCE_DIRECTORY.bld                         &&
  ./lndir ../xc/                                   &&

  make World
  
  # Fix Bug #3486, which stops the build process
  #[now appears to be evident on only one of my test machines, 
  #the one with xfree86 already installed (hgg09/08/03)]
  #

  mkdir  lib/font/builtins/unshared                              &&
  cp  lib/font/builtins/*.*  lib/font/builtins/unshared          &&

  #
  # Start compiling where the prior left off
  #
  make                                                           &&
  prepare_install                                                &&
  # the following is needed for pkgconfig to find the .pc files
  mkdir  -p  /usr/X11R6/lib                                      &&
  ln -sf  /usr/lib/pkgconfig  /usr/X11R6/lib                     &&
  make  install                                                  &&
  make  install.man                                              &&
        install_drm                                              &&
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
