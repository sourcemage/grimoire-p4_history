(

  patch -p0 < $SCRIPT_DIRECTORY/MPlayer-cvs-ffmpeg.patch

  if  [  "$FONTCONFIG"  =  "y"  ];  then
    patch -p0 < $SCRIPT_DIRECTORY/MPlayer-cvs-fontconfig.patch
  fi

  case  $GUI  in
    y|Y)  OPTS="$OPTS  --enable-gui"  ;;
  esac

  case  $JOYSTICK  in
    y|Y)  OPTS="$OPTS  --enable-joystick"  ;;
  esac

  case  $OSD_MENU  in
    y|Y)  OPTS="$OPTS  --enable-menu"  ;;
  esac
  
  # temporary work around a configure bug for faad
  touch config.h

  CFLAGS= ./configure  --prefix=/usr  \
               --confdir=/etc/mplayer \
               $OPTS          &&

  make                        &&
  prepare_install             &&
  make    install             &&

  (

    mkdir -p           /usr/doc/MPlayer
    cp -r etc/*        /usr/doc/MPlayer

    if (ldd /usr/bin/mplayer | grep freetype) > /dev/null; then
      if ! (ldd /usr/bin/mplayer | grep fontconfig) > /dev/null; then
        cp  /usr/X11R6/lib/X11/fonts/TTF/luxisr.ttf  \
            /usr/share/mplayer/subfont.ttf
      fi
    fi
  
  )

) > $C_FIFO 2>&1
