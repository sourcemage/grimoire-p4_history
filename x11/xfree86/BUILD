# Version patch

message "${MESSAGE_COLOR} Aplying 4.2.0 -> 4.2.1 version patch ${DEFAULT_COLOR}"
gzip -d < $SCRIPT_DIRECTORY/4.2.0-4.2.1.diff.gz | patch -p1 -E

# mit-shm security patch

message "${MESSAGE_COLOR} Aplying mit-shm security patch ${DEFAULT_COLOR}"
gzip -d < $SCRIPT_DIRECTORY/4.2.1-mit-shm-security.patch.gz | patch -p1 -E

# xftgram patch. Thanks to Andrew Stitt

message "${MESSAGE_COLOR} Aplying xftgram patch Thanks to Andrew Stitt ${DEFAULT_COLOR}"
gzip -d < $SCRIPT_DIRECTORY/xftgram.patch.gz | patch -p1 -E

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

  echo  "#define  InstallXdmConfig    YES"  >>  config/cf/site.def
  echo  "#define  InstallXinitConfig  YES"  >>  config/cf/site.def

  if  spell_installed  Linux-PAM
  then  echo  "#define  HasPam  YES"  >>  config/cf/site.def
  fi

  make  World                                                    &&
  prepare_install                                                &&
  cd    $SOURCE_DIRECTORY                                        &&
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
