(

  # mp3lib doesn't work with gcc 3.3.2 and -fomit-frame-pointer
  sedit  's/-fomit-frame-pointer//'  configure  &&

  patch -p0 < $SCRIPT_DIRECTORY/alsa-1.0.patch            &&
  patch -p0 < $SCRIPT_DIRECTORY/MPlayer-cvs-ffmpeg.patch  &&

  if  [  "$FONTCONFIG"  =  "y"  ];  then
    patch -p0 < $SCRIPT_DIRECTORY/MPlayer-cvs-fontconfig.patch
  fi  &&

  case  $GUI  in
    y|Y)  OPTS="$OPTS  --enable-gui"  ;;
  esac  &&

  case  $JOYSTICK  in
    y|Y)  OPTS="$OPTS  --enable-joystick"  ;;
  esac  &&

  case  $OSD_MENU  in
    y|Y)  OPTS="$OPTS  --enable-menu"  ;;
  esac  &&
  
  # temporary work around a configure bug for faad
  touch config.h  &&

  CFLAGS= ./configure  --prefix=/usr  \
               --confdir=/etc/mplayer \
               $OPTS          &&

  make                        &&
  prepare_install             &&
  make    install             &&

  (

    if (ldd /usr/bin/mplayer | grep freetype) > /dev/null; then
      if ! (ldd /usr/bin/mplayer | grep fontconfig) > /dev/null; then
        if  [  -f  /usr/X11R6/lib/X11/fonts/TTF/luxisr.ttf ]; then
          cp  /usr/X11R6/lib/X11/fonts/TTF/luxisr.ttf  \
              /usr/share/mplayer/subfont.ttf
        else
          message "Couldn't find a font to install as default subtitle font."
          message "Make sure you copy a font to ~/.mplayer/subfont.ttf"
        fi
      fi
    fi
  
    if  [  !  -f  /etc/mplayer/mplayer.conf  ];  then
      sedit  "s/include =/# include =/"         etc/example.conf
      sedit  "s/# vo=/vo=/"                     etc/example.conf
      sedit  "s/# ao=/ao=/"                     etc/example.conf
      sedit  "s/# skin = default/skin = Blue/"  etc/example.conf
      cp  etc/example.conf                      /etc/mplayer/mplayer.conf
    fi

    if  [  !  -f  /etc/mplayer/input.conf  ];  then
      cp  etc/input.conf                 /etc/mplayer/input.conf
    fi

  )

) > $C_FIFO 2>&1
