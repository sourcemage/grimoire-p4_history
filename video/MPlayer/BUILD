(

  case  $GUI  in
    y|Y)  OPTS="$OPTS  --enable-gui"  ;;
  esac

  case  $JOYSTICK  in
    y|Y)  OPTS="$OPTS  --enable-joystick"  ;;
  esac

  case  $FREETYPE2  in
    y|Y)  OPTS="$OPTS  --enable-freetype"  ;;
  esac

  ./configure  --prefix=/usr  \
               --confdir=/etc/mplayer \
               $OPTS          &&
  # workaround for a glitch in the Makefile
  case  $FREETYPE2  in
    y|Y) sedit 's:-o $(PRG):-o $(PRG) -L/usr/lib -lfreetype:' Makefile
         sedit 's:-o $(PRG_MENCODER):-o $(PRG_MENCODER) -L/usr/lib -lfreetype:'\
           Makefile
         ;;
  esac
  make                        &&
  prepare_install             &&
  make    install             &&

  (

    mkdir -p           /usr/doc/MPlayer
    cp -r etc/*        /usr/doc/MPlayer

    case  $FREETYPE2  in
      y|Y)  cp  /usr/X11R6/lib/X11/fonts/TTF/luxisr.ttf  \
                /usr/share/mplayer/subfont.ttf
            ;;
    esac
  
  )

) > $C_FIFO 2>&1
