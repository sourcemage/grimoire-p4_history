(

  case  $GUI  in
    y|Y|j|J)  OPTS="$OPTS  --enable-gui"  ;;
  esac

  ./configure  --prefix=/usr  \
               $OPTS          &&
  make                        &&
  prepare_install             &&
  make    install  prefix=/usr

) > $C_FIFO 2>&1  &&  (

  mkdir  -p                /usr/doc/mplayer
  cp     -r  etc/*         /usr/doc/mplayer
  mkdir  -p                /usr/share/mplayer
  cp     etc/codecs.conf   /usr/share/mplayer

  if  [  !  -f  /etc/mplayer/mplayer.conf  ];  then
    sedit  "s/include =/# include =/"  etc/example.conf
    sedit  "s/# vo=/vo=/"              etc/example.conf
    sedit  "s/# ao=/ao=/"              etc/example.conf
    cp     etc/example.conf           /etc/mplayer.conf
  fi

  if  [  "$GUI"  ==  "y"  ];  then
    cp     -r   Skin                       /usr/share/mplayer
    cp     -r   fonts                      /usr/share/mplayer
    ln     -sf  fonts/iso-8859-1/arial-18  /usr/share/mplayer/font
  fi

)
